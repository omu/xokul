# frozen_string_literal: true

module Services
  module Kps
    class Base
      include SafeRequest

      def initialize
        @client = Client.new(self.class::WSDL_URL)
      end

      protected

      attr_reader :client
    end

    private_constant :Base
  end
end
