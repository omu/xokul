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

      KPS_TEMPLATE = <<-TEMPLATE.freeze
      <s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope"
      xmlns:wsa="http://www.w3.org/2005/08/addressing"
      xmlns:dsig="http://www.w3.org/2000/09/xmldsig#"
      xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"
      xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
      xmlns:wst="http://docs.oasis-open.org/ws-sx/ws-trust/200512"
      xmlns:b="http://docs.oasis-open.org/wss/oasis-wss-wssecurity-secext-1.1.xsd">
      <s:Header>
          <wsse:Security>
              <wsu:Timestamp xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd" wsu:Id="_0">
                  <wsu:Created><%= created %></wsu:Created>
                  <wsu:Expires><%= expires %></wsu:Expires>
              </wsu:Timestamp>
              <%= encrypted_data %>
              <dsig:Signature>
                  <dsig:SignedInfo xmlns:dsig="http://www.w3.org/2000/09/xmldsig#">
                      <dsig:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
                      <dsig:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#hmac-sha1"/>
                      <dsig:Reference URI="#_0">
                          <dsig:Transforms>
                              <dsig:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"></dsig:Transform>
                          </dsig:Transforms>
                          <dsig:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
                          <dsig:DigestValue><%= digest_value %></dsig:DigestValue>
                      </dsig:Reference>
                  </dsig:SignedInfo>
                  <dsig:SignatureValue><%= signature_value %></dsig:SignatureValue>
                  <dsig:KeyInfo>
                      <wsse:SecurityTokenReference b:TokenType="http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1">
                          <wsse:KeyIdentifier ValueType="http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID"><%= saml_assertion_id %></wsse:KeyIdentifier>
                      </wsse:SecurityTokenReference>
                  </dsig:KeyInfo>
              </dsig:Signature>
          </wsse:Security>
          <wsa:To>https://kpsv2.nvi.gov.tr/Services/RoutingService.svc</wsa:To>
          <wsa:Action><%= action %></wsa:Action>
      </s:Header>
      <s:Body><%= body %></s:Body>
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
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        req = Net::HTTP::Get.new(uri.path)
        req['Content-Type'] = 'application/soap+xml; charset=utf-8'
        req.body = template
        http.request(req).body
      end

      def call(action, body)
        doc = Nokogiri::XML(token)

        doc.root.add_namespace('o', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd')
        doc.root.add_namespace('s', 'http://www.w3.org/2003/05/soap-envelope')
        doc.root.add_namespace('wst', 'http://docs.oasis-open.org/ws-sx/ws-trust/200512')
        doc.root.add_namespace('wsse', 'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd')
        doc.root.add_namespace('trust', 'http://docs.oasis-open.org/ws-sx/ws-trust/200512')

        created = doc.xpath('/s:Envelope/s:Header/o:Security/u:Timestamp/u:Created').text
        expires = doc.xpath('/s:Envelope/s:Header/o:Security/u:Timestamp/u:Expires').text

        encrypted_data = doc.xpath('/s:Envelope/s:Body/wst:RequestSecurityTokenResponseCollection/wst:RequestSecurityTokenResponse/wst:RequestedSecurityToken').children.to_xml
        saml_assertion_id = doc.xpath('/s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:RequestedAttachedReference/o:SecurityTokenReference/o:KeyIdentifier').text
        proof_key = doc.xpath('/s:Envelope/s:Body/wst:RequestSecurityTokenResponseCollection/wst:RequestSecurityTokenResponse/wst:RequestedProofToken/wst:BinarySecret').text

        timestamp_header = doc.xpath('/s:Envelope/s:Header/o:Security/u:Timestamp').first
        digest_value = Base64.encode64(Digest::SHA1.hexdigest(timestamp_header)).strip

        signed_info_text = <<~SIGNED_INFO
        <dsig:SignedInfo xmlns:dsig="http://www.w3.org/2000/09/xmldsig#">
            <dsig:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
            <dsig:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#hmac-sha1"/>
            <dsig:Reference URI="#_0">
                <dsig:Transforms><dsig:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"></dsig:Transform></dsig:Transforms>
                <dsig:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
                <dsig:DigestValue>#{digest_value}</dsig:DigestValue>
            </dsig:Reference>
        </dsig:SignedInfo>
        SIGNED_INFO

        signed_doc = Nokogiri::XML(signed_info_text)
        signature_value = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha1'), proof_key, signed_doc.to_s)).strip()

        tmpl = ERB.new(KPS_TEMPLATE).result(binding)

        uri = URI.parse('https://kpsv2.nvi.gov.tr/Services/RoutingService.svc')
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        req = Net::HTTP::Post.new(uri.path)
        req['Content-Type'] = 'application/soap+xml; charset=utf-8'
        req['Connection'] = 'keep-alive'
        req.body = tmpl
        http.request(req)
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
  body = <<~BODY
  <Sorgula xmlns="http://kps.nvi.gov.tr/2011/01/01" xmlns:ns2="http://schemas.microsoft.com/2003/10/Serialization/">
    <kriterListesi>
      <BilesikKutukSorgulaKimlikNoSorguKriteri>
        <KimlikNo>#{ENV['TEST_TC_NO']}</KimlikNo>
      </BilesikKutukSorgulaKimlikNoSorguKriteri>
    </kriterListesi>
  </Sorgula>
  BODY
  pp client.call('http://kps.nvi.gov.tr/2011/01/01/BilesikKutukSorgulaKimlikNoServis/Sorgula', body)
  # pp KPS::Public.tc_kimlik_no_dogrula(ENV['TEST_TC_NO'], ENV['TEST_DATE_OF_BIRTH'])
end

main if $PROGRAM_NAME == __FILE__
