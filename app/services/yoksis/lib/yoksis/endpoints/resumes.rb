# frozen_string_literal: true

module Services
  module Yoksis
    class Resumes
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'

      METHOD_VARIABLES.each_key do |method|
        define_method(method) do |username, password, id_number|
          safe_request(
            method,
            args: {
              parametre: {
                P_KULLANICI_ID: username, P_SIFRE: password,
                P_TC_KIMLIK_NO: id_number
              }
            }
          )
        end
      end
    end
  end
end
