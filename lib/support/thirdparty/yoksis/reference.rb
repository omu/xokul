# frozen_string_literal: true

module Thirdparty
  module Yoksis
    class Reference
      include ActiveSupport::Configurable
      include Singleton

      config_accessor :endpoint, instance_writer: false

      def initialize
        @client = SoapClient.new(endpoint)
      end

      def administrative_functions
        client.request(:get_personel_gorev)
      end

      def administrative_units
        client.request(:get_idari_birimler)
      end

      def countries
        client.request(:get_mernis_ulke)
      end

      def cities
        client.request(:get_il_getir)
      end

      def districts(city_code)
        client.request(:get_ilce_getir, message: { ILKODU: city_code })
      end

      protected

      attr_reader :client
    end

    def self.reference
      Reference.instance
    end
  end
end
