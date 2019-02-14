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

      def cities
        client.request(:get_il_getir)
      end

      protected

      attr_reader :client
    end

    def self.reference
      Reference.instance
    end
  end
end
