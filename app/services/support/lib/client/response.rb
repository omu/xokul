# frozen_string_literal: true

module Services
  module Support
    class Client
      class Response
        delegate :to_hash, to: :@soap_response
        delegate :code, :headers, to: :@http

        def initialize(soap_response, result_path:)
          @soap_response = soap_response
          @result_path = result_path
          @http = soap_response.http
        end

        def body
          to_hash.symbolize_keys
        end

        def absolute
          data = body.dig(*[@result_path].flatten)
          raise Support::UnknownResultPathError if data.blank?
          data
        end
      end
    end
  end
end
