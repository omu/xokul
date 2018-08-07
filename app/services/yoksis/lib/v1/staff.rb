# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Staff < Base
        WSDL_URL = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'

        def information(page, querier)
          client.call(
            STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__],
            PAGE: page, SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        def information_by_tck(queried, querier)
          client.call(
            STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__],
            AKPER_TC_KIMLIK_NO: queried, SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        def nationalities
          client.call(
            STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__]
          )
        end

        def page_number(querier)
          client.call(
            STAFF_METHODS[__method__],
            result_path: STAFF_RESULT_PATHS[__method__],
            SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
