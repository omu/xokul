# frozen_string_literal: true

module Services
  module Kps
    class Verifications
      WSDL_URL = ENV['KPS_PUBLIC_WSDL_URL'].freeze

      def identities(id_number:, first_name:, last_name:, year_of_birth:)
        response = client.request(
          ARGS.dig(:identities, :operation),
          args: {
            TCKimlikNo: id_number,
            Ad: first_name.upcase_tr,
            Soyad: last_name.upcase_tr,
            DogumYili: year_of_birth
          }
        )

        response.dig(*ARGS.dig(:identities, :result))
      end
    end
  end
end
