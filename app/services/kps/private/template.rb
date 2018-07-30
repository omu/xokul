# frozen_string_literal: true

require 'securerandom'

module Services
  module Kps
    module Private
      class Template
        attr_reader :endpoint_reference

        def initilize(endpoint_reference)
          @endpoint_reference = endpoint_reference
        end

        # It returns an XML template that is formatted and has a lot of attribute
        # which is wrapped with string interpolation. It will also be used to
        # get sts token.
        def sts_request(sts_url, username, password)
          <<-TEMPLATE
          <s:Envelope
            xmlns:s="http://www.w3.org/2003/05/soap-envelope"
            xmlns:a="http://www.w3.org/2005/08/addressing"
            xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd">
            <s:Header>
              <a:Action s:mustUnderstand="1">http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue</a:Action>
              <a:MessageID>
                urn:uuid:#{SecureRandom.uuid}
              </a:MessageID>
              <a:ReplyTo>
                <a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address>
              </a:ReplyTo>
              <a:To s:mustUnderstand="1">
                #{sts_url}
              </a:To>
              <o:Security xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" s:mustUnderstand="1">
                <u:Timestamp u:Id="_1">
                  <u:Created>
                    #{created_time}
                  </u:Created>
                  <u:Expires>
                    #{expires_time}
                  </u:Expires>
                </u:Timestamp>
                <o:UsernameToken u:Id="_2">
                  <o:Username>
                    #{username}
                  </o:Username>
                  <o:Password Type="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-username-token-profile-1.0#PasswordText">
                    #{password}
                  </o:Password>
                </o:UsernameToken>
              </o:Security>
            </s:Header>
            <s:Body>
              <trust:RequestSecurityToken xmlns:trust="http://docs.oasis-open.org/ws-sx/ws-trust/200512">
                <wsp:AppliesTo xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy">
                  <a:EndpointReference>
                    <a:Address>
                      #{endpoint_reference}
                    </a:Address>
                  </a:EndpointReference>
                </wsp:AppliesTo>
                <trust:RequestType>http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue</trust:RequestType>
              </trust:RequestSecurityToken>
            </s:Body>
          </s:Envelope>
          TEMPLATE
        end

        # It returns a beautified XML template. There is a lot of uncalled
        # attribute in it. It will be used to send a service request to kps
        # endpoints.
        def kps_request(action, body, encrypted_data, digest, signature, assertion_id)
          <<-TEMPLATE
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
                  <wsu:Created>
                    #{created_time}
                  </wsu:Created>
                  <wsu:Expires>
                    #{expires_time}
                  </wsu:Expires>
                </wsu:Timestamp>
                #{encrypted_data}
                <dsig:Signature>
                  <dsig:SignedInfo xmlns:dsig="http://www.w3.org/2000/09/xmldsig#">
                    <dsig:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
                    <dsig:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#hmac-sha1"/>
                    <dsig:Reference URI="#_0">
                      <dsig:Transforms>
                        <dsig:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#"/>
                      </dsig:Transforms>
                      <dsig:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1"/>
                      <dsig:DigestValue>
                        #{digest}
                      </dsig:DigestValue>
                    </dsig:Reference>
                  </dsig:SignedInfo>
                  <dsig:SignatureValue>
                    #{signature}
                  </dsig:SignatureValue>
                  <dsig:KeyInfo>
                    <wsse:SecurityTokenReference b:TokenType="http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1">
                      <wsse:KeyIdentifier ValueType="http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID">
                        #{assertion_id}
                      </wsse:KeyIdentifier>
                    </wsse:SecurityTokenReference>
                  </dsig:KeyInfo>
                </dsig:Signature>
              </wsse:Security>
              <wsa:To>
                #{endpint_reference}
              </wsa:To>
              <wsa:Action>
                #{action}
              </wsa:Action>
            </s:Header>
            <s:Body>
              #{body}
            </s:Body>
          </s:Envelope>
          TEMPLATE
        end

        private

        TIME_FORMAT = "%Y-%m-%d\T%H:%M:%S\Z"
        private_constant :TIME_FORMAT

        def created_time
          Time.zone.now.strftime(TIME_FORMAT)
        end

        def expires_time(duration = 600)
          (Time.zone.now + duration).strftime(TIME_FORMAT)
        end
      end
    end
  end
end
