# frozen_string_literal: true

module Services
  module Yoksis
    class Graduates
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'

      def informations(id_number:)
        @informations = client.request(
          ARGS.dig(:informations, :operation), args: { TCKNO: id_number }
        )

        raise InvalidResponseError if informations_has_error?
        raise NoContentError unless informations_has_response?
        informations_result
      end

      private

      def informations_has_error?
        @informations.dig(*ARGS.dig(:informations, :status)) != 'Başarılı'
      end

      def informations_has_response?
        @informations.dig(*ARGS.dig(:informations, :result), &:present?)
      end

      def informations_result
        @informations.dig(*ARGS.dig(:informations, :result))
      end
    end
  end
end
