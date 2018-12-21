# frozen_string_literal: true

module Services
  module Kps
    class Base
      def initialize
        @client = SoapClient.new(self.class::WSDL_URL)
      end

      protected

      attr_reader :client
    end

    private_constant :Base
  end
end
