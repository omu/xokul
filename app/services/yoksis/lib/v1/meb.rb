# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class MEB < Base
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'

        def graduation_data(tck_no, service_password = nil)
          client.call(
            MEB_METHODS[__callee__],
            result_path: MEB_RESULT_PATHS[__callee__],
            TCKIMLIKNO: tck_no, ServicePassWord: service_password
          )
        end

        alias detailed_graduation_data graduation_data

        protected

        attr_reader :client

        def after_initialize
          client.configure { |config| config.soap_version 2 }
        end
      end
    end
  end
end
