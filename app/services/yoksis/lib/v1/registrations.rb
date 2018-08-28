# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Registrations < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/ekayitv1?wsdl'

        def foundation_tuitions(id_number, paid)
          client.request(
            operation: REGISTRATIONS_METHODS[__method__],
            args: { TCKN: id_number, OGRENIM_UCRETI_ODENDI_MI: paid },
            result_path: REGISTRATIONS_RESULT_PATHS[__method__]
          )
        end

        def queries_by_date(day, month, year, unit_id)
          client.request(
            operation: REGISTRATIONS_METHODS[__method__],
            args: {
              GUN: day, AY: month, YIL: year,
              YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
            },
            result_path: REGISTRATIONS_RESULT_PATHS[__method__]
          )
        end

        def queries_by_id_number(id_number, unit_id)
          client.request(
            operation: REGISTRATIONS_METHODS[__method__],
            args: { TCKN: id_number, YOKSIS_UNIVERSITE_BIRIM_ID: unit_id },
            result_path: REGISTRATIONS_RESULT_PATHS[__method__]
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
