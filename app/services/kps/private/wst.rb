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

        # rubocop:disable Metrics/MethodLength
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
              expires_time:   Utils.timestamp(600),
              reference:      reference,
              signature:      signature
            )
          )
        end
        # rubocop:enable Metrics/MethodLength

        private

        def assertion_id
          @xml_doc.xpath(ASSERTION_ID_XPATH).text
        end

        def digest
          timestamp_block = @xml_doc.xpath(TIMESTAMP_XPATH)
          Base64.encode64(Digest::SHA1.hexdigest(timestamp_block))
        end

        def encrypted_data
          @xml_doc.xpath(ENCRYPTED_DATA_XPATH).to_xml
        end

        def proof_key
          @xml_doc.xpath(PROOF_KEY_XPATH).text
        end

        def signature
          signed_info = format(SIGNED_INFO, digest: digest)
          Base64.encode64(
            OpenSSL::HMAC.digest(
              OpenSSL::Digest.new('sha1'), proof_key, signed_info
            )
          )
        end
      end
    end
  end
end
