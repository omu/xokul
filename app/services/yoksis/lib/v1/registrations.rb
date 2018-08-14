# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Registrations < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/ekayitv1?wsdl'

        def foundation_tuitions(id_number, paid)
          client.request(
            REGISTRATIONS_METHODS[__method__],
            result_path: REGISTRATIONS_RESULT_PATHS[__method__],
            TCKN: id_number,
            OGRENIM_UCRETI_ODENDI_MI: paid
          )
        end

        def queries_by_date(day, month, year, unit_id)
          client.request(
            REGISTRATIONS_METHODS[__method__],
            result_path: REGISTRATIONS_RESULT_PATHS[__method__],
            GUN: day,
            AY: month,
            YIL: year,
            YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
          )
        end

        def queries_by_id_number(id_number, unit_id)
          client.request(
            REGISTRATIONS_METHODS[__method__],
            result_path: REGISTRATIONS_RESULT_PATHS[__method__],
            TCKN: id_number,
            YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
