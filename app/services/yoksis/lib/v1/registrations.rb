# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Registrations < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/ekayitv1?wsdl'

        def foundation_tuition(tck_no, paid)
          client.call(
            REGISTRATIONS_METHODS[__method__],
            result_path: REGISTRATIONS_RESULT_PATHS[__method__],
            TCKN: tck_no,
            OGRENIM_UCRETI_ODENDI_MI: paid
          )
        end

        def query_by_date(day, month, year, unit_id)
          client.call(
            REGISTRATIONS_METHODS[__method__],
            result_path: REGISTRATIONS_RESULT_PATHS[__method__],
            GUN: day,
            AY: month,
            YIL: year,
            YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
          )
        end

        def query_by_tck(tck_no, unit_id)
          client.call(
            REGISTRATIONS_METHODS[__method__],
            result_path: REGISTRATIONS_RESULT_PATHS[__method__],
            TCKN: tck_no,
            YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
