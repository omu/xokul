# frozen_string_literal: true

module Services
  module Support
    class Response
      delegate :successful?, :to_hash, to: :@soap_response

      def initialize(action, soap_response)
        @action = action
        @soap_response = soap_response
      end

      def response
        _, value = to_hash[:"#{@action}_response"].first
        value || {}
      end
    end
  end
end
