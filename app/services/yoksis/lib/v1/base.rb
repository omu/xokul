# frozen_string_literal: true

module Services
  class Yoksis
    module V1
      class Base
        def initialize(*args)
          @client = Support::Client.new(self.class::WSDL_URL)
          client.basic_auth(*args) unless args.empty?
          after_initialize
        end

        protected

        attr_reader :client

        def after_initialize; end
      end

      private_constant :Base
    end
  end
end
