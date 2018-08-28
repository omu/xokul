# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Students < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'

        def informations(id_number)
          client.request(
            operation: STUDENTS_METHODS[__method__],
            args: { TC_KIMLIK_NO: id_number },
            result_path: STUDENTS_RESULT_PATHS[__callee__]
          )
        end

        alias personal_informations informations
        alias studentship_informations informations
        alias unit_informations informations
        alias undergrad_transfer_informations informations

        protected

        attr_reader :client
      end
    end
  end
end
