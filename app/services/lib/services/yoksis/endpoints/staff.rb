# frozen_string_literal: true

module Services
  module Yoksis
    class Staff
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'

      def academicians(querier:, queried:)
        @academicians = client.request(
          ARGS.dig(:academicians, :operation),
          args: {
            SORGULAYAN_TC_KIMLIK_NO: querier, AKPER_TC_KIMLIK_NO: queried
          }
        )

        raise NoContentError unless academicians_has_response?
        academicians_result
      end

      def nationalities
        @nationalities = client.request(ARGS.dig(:nationalities, :operation))

        raise InvalidResponseError if nationalities_has_error?
        raise NoContentError unless nationalities_has_response?
        nationalities_result
      end

      def pages(querier:, page:)
        @pages = client.request(
          ARGS.dig(:pages, :operation),
          args: { SAYFA: page, SORGULAYAN_TC_KIMLIK_NO: querier }
        )

        raise InvalidResponseError if pages_has_error?
        raise NoContentError unless pages_has_response?
        pages_result
      end

      private

      def academicians_has_response?
        @academicians.dig(*ARGS.dig(:academicians, :result), &:present?)
      end

      def academicians_result
        @academicians.dig(*ARGS.dig(:academicians, :result))
      end

      def nationalities_has_error?
        @nationalities.dig(*ARGS.dig(:nationalities, :status)) != 'Başarılı'
      end

      def nationalities_has_response?
        @nationalities.dig(*ARGS.dig(:nationalities, :result), &:present?)
      end

      def nationalities_result
        @nationalities.dig(*ARGS.dig(:nationalities, :result))
      end

      def pages_has_error?
        @pages.dig(*ARGS.dig(:pages, :status)) != 'Başarılı'
      end

      def pages_has_response?
        @pages.dig(*ARGS.dig(:pages, :result), &:present?)
      end

      def pages_result
        @pages.dig(*ARGS.dig(:pages, :result))
      end
    end
  end
end
