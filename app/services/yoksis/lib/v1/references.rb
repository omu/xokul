# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class References < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'

        REFERENCES_METHODS.each do |name, operation|
          define_method(name) do
            client.request(operation: operation)
                  .result_by_path(REFERENCES_RESULT_PATHS[__method__])
          end
        end

        def districts(city_code:)
          client.request(
            operation: REFERENCES_METHODS[__method__],
            args: { ILKODU: city_code }
          ).result_by_path(REFERENCES_RESULT_PATHS[__method__])
        end

        protected

        attr_reader :client
      end
    end
  end
end
