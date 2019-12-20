# frozen_string_literal: true

module Services
  module Osym
    class Examination
      WSDL_URL = 'https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl'

      def initialize(username, password)
        @client = Client.new(
          WSDL_URL,
          savon_options: {
            basic_auth: [username, password],
            wsse_auth:  [username, password]
          }
        )
      end

      def groups
        @groups = client.request(ARGS.dig(:groups, :operation))

        raise InvalidResponseError if groups_has_error?
        raise NoContentError unless groups_has_response?

        groups_result
      end

      def result_informations(id_number:, year:, group_id:)
        @result_informations = client.request(
          ARGS.dig(:result_informations, :operation),
          args: { adayTcKimlikNo: id_number, yil: year, sinavGrupId: group_id }
        )

        raise InvalidResponseError if result_informations_has_error?
        raise NoContentError unless result_informations_has_response?

        result_informations_result
      end

      # This request returns a raw XML body. Therefore, it requires to parse
      # the body. Response will be processed later.
      def results(id_number:, result_id:)
        client.request(
          ARGS.dig(:results, :operation),
          args: { adayTcKimlikNo: id_number, sonucId: result_id }
        )
      end

      private

      def groups_has_error?
        @groups.dig(*ARGS.dig(:groups, :status)) != 'Basarili'
      end

      def groups_has_response?
        @groups.dig(*ARGS.dig(:groups, :result), &:present?)
      end

      def groups_result
        @groups.dig(*ARGS.dig(:groups, :result))
      end

      def result_informations_has_error?
        @result_informations.dig(
          *ARGS.dig(:result_informations, :status)
        ) != 'Basarili'
      end

      def result_informations_has_response?
        @result_informations.dig(
          *ARGS.dig(:result_informations, :result), &:present?
        )
      end

      def result_informations_result
        @result_informations.dig(*ARGS.dig(:result_informations, :result))
      end

      protected

      attr_reader :client
    end
  end
end
