# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Resumes < Base
        WSDL_URL = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'

        RESUMES_METHODS.each do |name, operation|
          define_method(name) do |username, password, id_number|
            client.request(
              operation: operation,
              args: {
                parametre: {
                  P_KULLANICI_ID: username, P_SIFRE: password,
                  P_TC_KIMLIK_NO: id_number
                }
              }
            ).result_by_path(RESUMES_RESULT_PATHS[name])
          end
        end

        protected

        attr_reader :client
      end
    end
  end
end
