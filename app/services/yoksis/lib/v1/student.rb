# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Student < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'

        def details(id_number)
          client.request(
            operation: STUDENT_METHODS[__method__],
            result_path: STUDENT_RESULT_PATHS[__method__],
            TC_KIMLIK_NO: id_number
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
