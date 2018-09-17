# frozen_string_literal: true

module Services
  module Kps
    class Verifications
      WSDL_URL = ENV['KPS_PUBLIC_WSDL_URL'].freeze

      def identities(id_number:, first_name:, last_name:, year_of_birth:)
        safe_request(
          __method__,
          args: {
            TCKimlikNo: id_number,
            Ad: first_name,
            Soyad: last_name,
            DogumYili: year_of_birth
          }
        )
      end
    end
  end
end
