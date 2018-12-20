# frozen_string_literal: true

module Services
  module Yoksis
    class Base
      def initialize(**options)
        @client  = SoapClient.new(self.class::WSDL_URL, **options)
        @options = options
        after_initialize
      end

      protected

      attr_reader :client

      def after_initialize; end
    end

    private_constant :Base
  end
end
