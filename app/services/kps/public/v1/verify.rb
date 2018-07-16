# frozen_string_literal: true

module Services
  module Kps
    module Public
      module V1
        class Verification
          WSDL_URL = 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL'

          def initialize
            @client = Client.new(WSDL_URL)
          end

          def identity_number(tck_no, year_of_birth, firstname, lastname)
            client.call(
              :tc_kimlik_no_dogrula,
              TCKimlikNo: tck_no, Ad: firstname, Soyad: lastname,
              DogumYili: year_of_birth
            )
          end

          attr_reader :client
        end
      end
    end
  end
end
