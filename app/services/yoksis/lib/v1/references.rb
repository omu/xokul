# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class References < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'

        REFERENCES_METHODS.each do |name, action|
          define_method(name) do
            client.request(action, result_path: REFERENCES_RESULT_PATHS[__method__])
          end
        end

        def district(province_code)
          client.request(
            :get_ilce_getir,
            result_path: REFERENCES_RESULT_PATHS[__method__],
            ILKODU: province_code
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
