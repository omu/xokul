# frozen_string_literal: true

module Services
  module Support
    class Client
      class Response
        delegate :to_hash, to: :@soap_response
        delegate :code, :headers, to: :@http

        def initialize(soap_response)
          @soap_response = soap_response
          @http = soap_response.http
        end

        def body
          to_hash.stringify_keys
        end

        def purify
          real_data = body.values.first
          real_data.first.last || {}
        end
      end
    end
  end
end
