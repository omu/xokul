# frozen_string_literal: true

module Services
  module Kps
    module Private
      class Wst
        def initialize(endpoint:, token:, reference:)
          @endpoint  = endpoint
          @reference = reference
          @xml_doc   = Nokogiri::XML(token)
        end

        def request(action:, body:)
          STS_NAMESPACES.each { |key, value| @xml_doc.root.add_namespace(key, value) }
          Utils.http_get(
            @endpoint,
            body: format(
              WST_TEMPLATE,
              action:         action,
              assertion_id:   assertion_id,
              body:           body,
              created_time:   Utils.timestamp,
              digest:         digest,
              encrypted_data: encrypted_data,
              expires_time:   Utils.timestamp,
              reference:      reference,
              signature:      signature
            )
          )
        end

        private

        def assertion_id
          @xml_doc.xpath(ASSERTION_ID_XPATH).text
        end

        def encrypted_data
          @xml_doc.xpath(ENCRYPTED_DATA_XPATH).to_xml
        end

        def proof_key
          @xml_doc.xpath(PROOF_KEY_XPATH).text
        end
      end
    end
  end
end
