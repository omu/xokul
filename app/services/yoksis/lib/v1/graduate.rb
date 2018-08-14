# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Graduate < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'

        def students(id_number)
          client.request(
            GRADUATE_METHODS[__method__],
            result_path: GRADUATE_RESULT_PATHS[__method__],
            TCKNO: id_number
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
