# frozen_string_literal: true

module Thirdparty
  module Yoksis
    class Reference
      include ActiveSupport::Configurable

      config_accessor :endpoint, instance_writer: false

      def initialize
        @client = SoapClient.new(endpoint)
      end

      protected

      attr_reader :client
    end
  end
end
