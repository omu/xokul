# frozen_string_literal: true

module Services
  module Kps
    # This code should definitely refactor in version 2.
    module Verifications
      module_function

      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/AbcSize
      def id_cards(**option)
        turkish_national = false

        %i[card_serial card_number tckk_serial].each do |param|
          turkish_national = true if option[param]
        end

        if turkish_national
          id_cards_by_turkish_nationals(option)
        else
          id_cards_by_foreign_nationals(option)
        end
      end

      def id_numbers(**option)
        client = Client.new(ENV['KPS_PUBLIC_WSDL_URL'])

        response = client.request(
          ARGS.dig(__method__, :operation),
          args: {
            TCKimlikNo: option[:id_number],
            Ad: option[:first_name].to_s.upcase(:turkic),
            Soyad: option[:last_name].to_s.upcase(:turkic),
            DogumYili: option[:year_of_birth]
          }
        )

        response.dig(*ARGS.dig(__method__, :result))
      end

      def id_cards_by_turkish_nationals(**option)
        client = Client.new(ENV['KPS_PUBLICV2_WSDL_URL'])
        args = {
          TCKimlikNo: option[:id_number],
          Ad: option[:first_name].to_s.upcase(:turkic),
          Soyad: option[:last_name].to_s.upcase(:turkic),
          DogumGun: option[:day_of_birth],
          DogumAy: option[:month_of_birth],
          DogumYil: option[:year_of_birth],
          CuzdanSeri: option[:card_serial],
          CuzdanNo: option[:card_number],
          TCKKSeriNo: option[:tckk_serial]
        }

        if option[:tckk_serial]
          args.delete(:CuzdanSeri)
          args.delete(:CuzdanNo)
        end

        response = client.request(
          ARGS.dig(__method__, :operation),
          args: args
        )

        response.dig(*ARGS.dig(__method__, :result))
      end

      def id_cards_by_foreign_nationals(**option)
        client = Client.new(ENV['KPS_PUBLIC_FOREIGN_NATIONALS_WSDL_URL'])

        response = client.request(
          ARGS.dig(__method__, :operation),
          args: {
            KimlikNo: option[:id_number],
            Ad: option[:first_name].to_s.upcase,
            Soyad: option[:last_name].to_s.upcase,
            DogumGun: option[:day_of_birth],
            DogumAy: option[:month_of_birth],
            DogumYil: option[:year_of_birth]
          }
        )

        response.dig(*ARGS.dig(__method__, :result))
      end

      private_class_method :id_cards_by_turkish_nationals
      private_class_method :id_cards_by_foreign_nationals
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
    end
  end
end
