# frozen_string_literal: true

module Services
  module Yoksis
    module V1
      class MEB
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'

        def initialize
          @client = Client.new(WSDL_URL)
          @client.configure { |config| config.soap_version 2 }
        end

        def graduation_data(tck_no, service_password)
          client.call(
            MEB_METHODS[__method__],
            TC_KIMLIK_NO: tck_no, ServicePassWord: service_password
          )
        end

        alias detailed_graduation_data graduation_data

        attr_reader :client
      end
    end
  end
end
