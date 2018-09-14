# frozen_string_literal: true

module Services
  module Yoksis
    class MEB
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'

      def students(id_number:, service_password: nil)
        safe_request(
          __method__,
          args: { TCKIMLIKNO: id_number, ServicePassWord: service_password }
        )
      end

      protected

      def after_initialize
        client.configure { |config| config.soap_version 2 }
      end
    end
  end
end
