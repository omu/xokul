# frozen_string_literal: true

module Services
  module Yoksis
    class Students
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'

      def informations(id_number:)
        @informations = client.request(
          ARGS.dig(:informations, :operation), args: { TC_KIMLIK_NO: id_number }
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
        information = [
          @informations.dig(*ARGS.dig(:informations, :result))
        ].flatten.first

        information.present? &&
          information.dig(:kisisel_bilgiler, :tc_kimlik_no, &:present?)
      end

      def informations_result
        @informations.dig(*ARGS.dig(:informations, :result))
      end
    end
  end
end
