# frozen_string_literal: true

module Services
  module Yoksis
    class Staff
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'

      def academicians(querier:, queried:)
        safe_request(
          __method__,
          args: {
            SORGULAYAN_TC_KIMLIK_NO: querier, AKPER_TC_KIMLIK_NO: queried
          }
        )
      end

      def nationalities
        safe_request(__method__)
      end

      def pages(querier:, page:)
        safe_request(
          __method__, args: { SAYFA: page, SORGULAYAN_TC_KIMLIK_NO: querier }
        )
      end
    end
  end
end
