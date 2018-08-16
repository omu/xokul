# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class References < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'

        REFERENCES_METHODS.each do |name, operation|
          define_method(name) do
            client.request(
              operation: operation,
              result_path: REFERENCES_RESULT_PATHS[__method__]
            )
          end
        end

        def districts(city_code)
          client.request(
            operation: REFERENCES_METHODS[__method__],
            result_path: REFERENCES_RESULT_PATHS[__method__],
            ILKODU: city_code
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
