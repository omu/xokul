# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Units < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'

        def changes(day, month, year)
          client.request(
            operation: UNITS_METHODS[__method__],
            args: { GUN: day, AY: month, YIL: year }
          ).result_by_path(UNITS_RESULT_PATHS[__method__])
        end

        def subunits(unit_id)
          client.request(
            operation: UNITS_METHODS[__callee__],
            args: { BIRIM_ID: unit_id }
          ).result_by_path(UNITS_RESULT_PATHS[__method__])
        end

        def universities
          client.request(operation: UNITS_METHODS[__method__])
                .result_by_path(UNITS_RESULT_PATHS[__method__])
        end

        alias programs subunits

        protected

        attr_reader :client
      end
    end
  end
end
