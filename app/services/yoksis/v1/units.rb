# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      class Units
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'

        @client = Client.new(WSDL_URL)

        class << self
          def changes(day, month, year)
            client.call(
              UNITS_METHODS[__method__],
              message: { 'GUN' => day, 'AY' => month, 'YIL' => year }
            )
          end

          def universities
            client.call(UNITS_METHODS[__method__])
          end

          def subunits(unit_id)
            client.call(
              UNITS_METHODS[__method__],
              message: { 'BIRIM_ID' => unit_id }
            )
          end

          attr_reader :client
        end
      end
    end
  end
end
