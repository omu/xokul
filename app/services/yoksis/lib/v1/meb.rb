# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class MEB < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'

        def students(id_number, service_password = nil)
          client.request(
            operation: MEB_METHODS[__callee__],
            args: { TCKIMLIKNO: id_number, ServicePassWord: service_password }
          ).read_from_body(MEB_RESULT_PATHS[__callee__])
        end

        protected

        attr_reader :client

        def after_initialize
          client.configure { |config| config.soap_version 2 }
        end
      end
    end
  end
end
