# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class MEB
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'

        def graduation_data(tck_no, service_password)
          client.call(
            __method__,
            TC_KIMLIK_NO: tck_no, ServicePassWord: service_password
          )
        end

        alias detailed_graduation_data graduation_data

        protected

        attr_reader :client

        def after_initialize
          @client.configure { |config| config.soap_version 2 }
        end
      end
    end
  end
end
