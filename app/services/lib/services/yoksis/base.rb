# frozen_string_literal: true

module Services
  module Yoksis
    class Base
      def initialize(**options)
        @client  = Client.new(self.class::WSDL_URL, savon_options: options)
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
