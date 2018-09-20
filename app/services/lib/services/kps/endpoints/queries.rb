# frozen_string_literal: true

module Services
  module Kps
    class Queries
      WSDL_URL = ENV['KPS_PRIVATE_WSDL_URL'].freeze

      def addresses(id_number:)
        @addresses = client.request(
          ARGS.dig(:addresses, :operation), args: { KimlikNo: id_number }
        )

        raise InvalidResponseError if addresses_has_error?
        raise NoContentError unless addresses_has_response?
        addresses_response
      end

      def identities(id_number:)
        @identities = client.request(
          ARGS.dig(:identities, :operation), args: { KimlikNo: id_number }
        )

        raise InvalidResponseError if identities_has_error?
        raise NoContentError unless identities_has_response?
        identities_response
      end

      private

      def addresses_has_error?
        @addresses.dig(*ARGS.dig(:addresses, :status), &:present?)
      end

      def addresses_has_response?
        @addresses.dig(*ARGS.dig(:addresses, :result), &:present?)
      end

      def addresses_response
        @addresses.dig(*ARGS.dig(:addresses, :result))
      end

      def identities_has_error?
        @identities.dig(*ARGS.dig(:identities, :status), &:present?)
      end

      def identities_has_response?
        @identities.dig(*ARGS.dig(:identities, :result), &:present?)
      end

      def identities_response
        @identities.dig(*ARGS.dig(:identities, :result))
      end
    end
  end
end
