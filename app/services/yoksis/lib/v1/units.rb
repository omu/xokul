# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Units < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'

        def changes_in_unit(day, month, year)
          client.call(
            UNITS_METHODS[__method__], GUN: day, AY: month, YIL: year
          )
        end

        def subunits(unit_id)
          client.call(UNITS_METHODS[__method__], BIRIM_ID: unit_id)
        end

        def universities
          client.call(UNITS_METHODS[__method__])
        end

        alias programs_under_subunit subunits
        alias unitname subunits

        protected

        attr_reader :client
      end
    end
  end
end
