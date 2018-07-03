#!/usr/bin/env ruby

require 'erb'
require 'logger'
require 'net/http'
require 'openssl'
require 'savon'
require 'securerandom'
require 'time'
require 'uri'

module KPS
  # =>
  class Public
    WSDL_ENDPOINT = 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL'.freeze

    @client = Savon.client(
      wsdl: WSDL_ENDPOINT,
      encoding: 'UTF-8',
      log: Logger
    )

    def self.tc_kimlik_no_dogrula(tc_no, date_of_birth, firstname = '', lastname = '')
      @client.call(
        __method__,
        message: {
          'TCKimlikNo' => tc_no,
          'Ad' => firstname,
          'Soyad' => lastname,
          'DogumYili' => date_of_birth
        }
      ).body
    end
  end

  module Private
    # =>
    class Client
      # WS-Security STS url
      STS_URL = 'https://kimlikdogrulama.nvi.gov.tr/Services/Issuer.svc/IWSTrust13'.freeze

      # Default sts request template
      REQUEST_TEMPLATE = <<~TEMPLATE.freeze
      <?xml version="1.0"?>
      <s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope" xmlns:a="http://www.w3.org/2005/08/addressing" xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
        <s:Header>
          <a:Action s:mustUnderstand="1">http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue</a:Action>
          <a:MessageID>urn:uuid:<%= SecureRandom.uuid %></a:MessageID>
          <a:ReplyTo>
            <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
          </a:ReplyTo>
          <a:To s:mustUnderstand="1">https://kimlikdogrulama.nvi.gov.tr/Services/Issuer.svc/IWSTrust13</a:To>
          <o:Security xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" s:mustUnderstand="1">
            <u:Timestamp u:Id="_1">
              <u:Created><%= created_time %></u:Created>
              <u:Expires><%= expires_time %></u:Expires>
            </u:Timestamp>
            <o:UsernameToken u:Id="_2">
              <o:Username><%= username %></o:Username>
              <o:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText"><%= password %></o:Password>
            </o:UsernameToken>
          </o:Security>
        </s:Header>
        <s:Body>
          <trust:RequestSecurityToken xmlns:trust="http://docs.oasis-open.org/ws-sx/ws-trust/200512">
            <wsp:AppliesTo xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy">
              <a:EndpointReference>
                <a:Address>https://kpsv2.nvi.gov.tr/Services/RoutingService.svc</a:Address>
              </a:EndpointReference>
            </wsp:AppliesTo>
            <trust:RequestType>http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue</trust:RequestType>
          </trust:RequestSecurityToken>
        </s:Body>
      </s:Envelope>
      TEMPLATE

      attr_reader :username, :password

      def initialize(username, password)
        @username = username
        @password = password
      end

      def created_time
        timestamp
      end

      def expires_time
        timestamp(600)
      end

      def template
        ERB.new(REQUEST_TEMPLATE).result(binding)
      end

      def token
        uri = URI.parse(STS_URL)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode =OpenSSL::SSL::VERIFY_PEER
        req = Net::HTTP::Post.new(uri.path)
        req['Content-Type'] = 'application/soap+xml; charset=utf-8'
        req.body = template
        http.request(req).body
      end

      private

      def timestamp(range = 0)
        (Time.now.utc + range).strftime("%Y-%m-%d\T%H:%M:%S\Z")
      end
    end
  end
end

def main
  client = KPS::Private::Client.new(ENV['KPS_USERNAME'], ENV['KPS_PASSWORD'])
  pp client.token
  pp KPS::Public.tc_kimlik_no_dogrula(ENV['TEST_TC_NO'], ENV['TEST_DATE_OF_BIRTH'])
end

main if $PROGRAM_NAME == __FILE__
