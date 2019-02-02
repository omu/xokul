# frozen_string_literal: true

module Services
  module Kps
    # This codes will be rewritten for version 2.
    module Verifications
      module_function

      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/AbcSize
      def identity_cards(**options)
        client = Client.new(ENV['KPS_PUBLICV2_WSDL_URL'])

        response = client.request(
          ARGS.dig(:identity_cards, :operation),
          args: {
            TCKimlikNo: options.fetch(:id_number),
            Ad: options.fetch(:first_name).to_s.upcase(:turkic),
            Soyad: options.fetch(:last_name).to_s.upcase(:turkic),
            DogumGun: options.fetch(:day_of_birth),
            DogumAy: options.fetch(:month_of_birth),
            DogumYil: options.fetch(:year_of_birth),
            CuzdanSeri: options.fetch(:card_serial_code),
            CuzdanNo: options.fetch(:card_number)
          }
        )

        response.dig(*ARGS.dig(:identity_cards, :result))
      end

      def identity_numbers(**options)
        client = Client.new(ENV['KPS_PUBLIC_WSDL_URL'])

        response = client.request(
          ARGS.dig(:identity_numbers, :operation),
          args: {
            TCKimlikNo: options.fetch(:id_number),
            Ad: options.fetch(:first_name).to_s.upcase(:turkic),
            Soyad: options.fetch(:last_name).to_s.upcase(:turkic),
            DogumYili: options.fetch(:year_of_birth)
          }
        )

        response.dig(*ARGS.dig(:identity_numbers, :result))
      end

      def foreign_nationals(**options)
        client = Client.new(ENV['KPS_PUBLIC_FOREIGN_NATIONALS_WSDL_URL'])

        response = client.request(
          ARGS.dig(:foreign_nationals, :operation),
          args: {
            KimlikNo: options.fetch(:id_number),
            Ad: options.fetch(:first_name).to_s.upcase,
            Soyad: options.fetch(:last_name).to_s.upcase,
            DogumGun: options.fetch(:day_of_birth),
            DogumAy: options.fetch(:month_of_birth),
            DogumYil: options.fetch(:year_of_birth)
          }
        )

        response.dig(*ARGS.dig(:foreign_nationals, :result))
      end

      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end
