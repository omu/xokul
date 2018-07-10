# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      class Units
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'

        @client = Client.new(WSDL_URL)

        class << self
          def universities
            client.call(UNITS_METHODS[__method__])
          end

          attr_reader :client
        end
      end
    end
  end
end
