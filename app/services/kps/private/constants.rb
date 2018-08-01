# frozen_string_literal: true

module Services
  module Kps
    module Private
      ASSERTION_ID_XPATH   = '/s:Envelope/s:Body/trust:RequestSecurityTokenResponseCollection/trust:RequestSecurityTokenResponse/trust:RequestedAttachedReference/o:SecurityTokenReference/o:KeyIdentifier'
      ENCRYPTED_DATA_XPATH = '/s:Envelope/s:Body/wst:RequestSecurityTokenResponseCollection/wst:RequestSecurityTokenResponse/wst:RequestedSecurityToken'
      PROOF_KEY_XPATH      = '/s:Envelope/s:Body/wst:RequestSecurityTokenResponseCollection/wst:RequestSecurityTokenResponse/wst:RequestedProofToken/wst:BinarySecret'
      SIGNED_INFO          = '<dsig:SignedInfo xmlns:dsig="http://www.w3.org/2000/09/xmldsig#"><dsig:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" /><dsig:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#hmac-sha1" /><dsig:Reference URI="#_0"><dsig:Transforms><dsig:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" /></dsig:Transforms><dsig:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" /><dsig:DigestValue>%<digest>s</dsig:DigestValue></dsig:Reference></dsig:SignedInfo>'
      STS_NAMESPACES       = {
        o:                   'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd',
        s:                   'http://www.w3.org/2003/05/soap-envelope',
        trust:               'http://docs.oasis-open.org/ws-sx/ws-trust/200512',
        wsse:                'http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd',
        wst:                 'http://docs.oasis-open.org/ws-sx/ws-trust/200512'
      }.freeze
      STS_TEMPLATE         = '<s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope" xmlns:a="http://www.w3.org/2005/08/addressing" xmlns:u="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><s:Header><a:Action s:mustUnderstand="1">http://docs.oasis-open.org/ws-sx/ws-trust/200512/RST/Issue</a:Action><a:MessageID>urn:uuid:%<uuid>s</a:MessageID><a:ReplyTo><a:Address>http://www.w3.org/2005/08/addressing/anonymous</a:Address></a:ReplyTo><a:To s:mustUnderstand="1">%<endpoint>s</a:To><o:Security xmlns:o="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" s:mustUnderstand="1"><u:Timestamp u:Id="_1"><u:Created>%<created_time>s</u:Created><u:Expires>%<expires_time>s</u:Expires></u:Timestamp><o:UsernameToken u:Id="_2"><o:Username>%<username>s</o:Username><o:Password>%<password>s</o:Password></o:UsernameToken></o:Security></s:Header><s:Body><trust:RequestSecurityToken xmlns:trust="http://docs.oasis-open.org/ws-sx/ws-trust/200512"><wsp:AppliesTo xmlns:wsp="http://schemas.xmlsoap.org/ws/2004/09/policy"><a:EndpointReference><a:Address>%<reference>s</a:Address></a:EndpointReference></wsp:AppliesTo><trust:RequestType>http://docs.oasis-open.org/ws-sx/ws-trust/200512/Issue</trust:RequestType></trust:RequestSecurityToken></s:Body></s:Envelope>'
      TIMESTAMP_XPATH      = '/s:Envelope/s:Header/o:Security/u:Timestamp'
      WST_TEMPLATE         = '<s:Envelope xmlns:s="http://www.w3.org/2003/05/soap-envelope" xmlns:b="http://docs.oasis-open.org/wss/oasis-wss-wssecurity-secext-1.1.xsd" xmlns:dsig="http://www.w3.org/2000/09/xmldsig#" xmlns:wsa="http://www.w3.org/2005/08/addressing" xmlns:wsse="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-secext-1.0.xsd" xmlns:wst="http://docs.oasis-open.org/ws-sx/ws-trust/200512" xmlns:wsu="http://docs.oasis-open.org/wss/2004/01/oasis-200401-wss-wssecurity-utility-1.0.xsd"><s:Header><wsse:Security><wsu:Timestamp wsu:Id="_0"><wsu:Created>%<created_time>s</wsu:Created><wsu:Expires>%<expires_time>s</wsu:Expires></wsu:Timestamp>%<encrypted_data>s<dsig:Signature><dsig:SignedInfo><dsig:CanonicalizationMethod Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" /><dsig:SignatureMethod Algorithm="http://www.w3.org/2000/09/xmldsig#hmac-sha1" /><dsig:Reference URI="#_0"><dsig:Transforms><dsig:Transform Algorithm="http://www.w3.org/2001/10/xml-exc-c14n#" /></dsig:Transforms><dsig:DigestMethod Algorithm="http://www.w3.org/2000/09/xmldsig#sha1" /><dsig:DigestValue>%<digest>s</dsig:DigestValue></dsig:Reference></dsig:SignedInfo><dsig:SignatureValue>%<signature>s</dsig:SignatureValue><dsig:KeyInfo><wsse:SecurityTokenReference b:TokenType="http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.1#SAMLV1.1"><wsse:KeyIdentifier ValueType="http://docs.oasis-open.org/wss/oasis-wss-saml-token-profile-1.0#SAMLAssertionID">%<assertion_id>s</wsse:KeyIdentifier></wsse:SecurityTokenReference></dsig:KeyInfo></dsig:Signature></wsse:Security><wsa:To>%<reference>s</wsa:To><wsa:Action>%<action>s</wsa:Action></s:Header><s:Body>%<body>s</s:Body></s:Envelope>'
    end
  end
end
