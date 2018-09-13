# frozen_string_literal: true

module Services
  module Yoksis
    class Base
      def initialize(**options)
        @client = Client.new(self.class::WSDL_URL, savon_options: options)
        after_initialize
      end

      def safe_request(method, args: {})
        variables = self.class::METHOD_VARIABLES[method]
        response = client.request(variables[:operation], args: args)
        response.status_body = variables[:status_body]
        raise Client::InvalidResponseError unless response.successful?
        response.body.dig(*variables[:special_body])
      end

      protected

      attr_reader :client

      def after_initialize; end
    end

    private_constant :Base
  end
end
