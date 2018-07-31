# frozen_string_literal: true

require 'securerandom'

module Services
  module Kps
    module Private
      # rubocop:disable Metrics/BlockLength
      Sts = Struct.new(:username, :password, :url, :endpoint_reference) do
        def token
          Utils.http_get(url, body: request_template)
        end

        private

        def request_template
          <<-TEMPLATE
          <s:Envelope
            xmlns:s="http://www.w3.org/2003/05/soap-envelope"
            xmlns:a="http://www.w3.org/2005/08/addressing"
            xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
            <s:Header>
              <a:Action s:mustUnderstand="1">
                http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue
              </a:Action>
              <a:MessageID>urn:uuid:#{SecureRandom.uuid}</a:MessageID>
              <a:ReplyTo>
                <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
              </a:ReplyTo>
              <a:To s:mustUnderstand="1">#{url}</a:To>
              <o:Security
                xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd"
                s:mustUnderstand="1">
                <u:Timestamp u:Id="_1">
                  <u:Created>#{Utils.timestamp}</u:Created>
                  <u:Expires>#{Utils.timestamp(600)}</u:Expires>
                </u:Timestamp>
                <o:UsernameToken u:Id="_2">
                  <o:Username>#{username}</o:Username>
                  <o:Password>#{password}</o:Password>
                </o:UsernameToken>
              </o:Security>
            </s:Header>
            <s:Body>
              <trust:RequestSecurityToken xmlns:trust="http://docs.oasis-open.org/ws-sx/ws-trust/200512">
                <wsp:AppliesTo xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy">
                  <a:EndpointReference>
                    <a:Address>#{endpoint_reference}</a:Address>
                  </a:EndpointReference>
                </wsp:AppliesTo>
                <trust:RequestType>
                  http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue
                </trust:RequestType>
              </trust:RequestSecurityToken>
            </s:Body>
          </s:Envelope>
          TEMPLATE
        end
      end
      # rubocop:enable Metrics/BlockLength
    end
  end
end
