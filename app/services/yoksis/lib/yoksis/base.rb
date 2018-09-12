# frozen_string_literal: true

module Services
  module Yoksis
    class Base
      def initialize(*args)
        @client = Client.new(self.class::WSDL_URL)
        client.basic_auth(*args) unless args.empty?
        after_initialize
      end

      def safe_request(method_name, **args)
        vars = self.class::METHOD_VARIABLES[method_name]
        resp = client.request(operation: vars[:soap_operation], **args)
        raise Client::InvalidResponseError if resp.error?(*vars[:status_path])
        resp.safe_dig(*vars[:data_path])
      end

      protected

      attr_reader :client

      def after_initialize; end
    end

    private_constant :Base
  end
end
