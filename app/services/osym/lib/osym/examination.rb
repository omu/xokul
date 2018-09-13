# frozen_string_literal: true

module Services
  module Osym
    class Examination
      WSDL_URL = 'https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl'

      def initialize(username, password)
        @client = Client.new(
          WSDL_URL,
          savon_options: {
            basic_auth: [username, password],
            wsse_auth:  [username, password]
          }
        )
      end

      def groups
        safe_request(__method__)
      end

      private

      def safe_request(method, args: {})
        variables = METHOD_VARIABLES[method]
        response = client.request(variables[:operation], args: args)
        response.status_body = variables[:status_body]
        raise Client::InvalidResponseError unless response.successful?
        response.body.dig(*variables[:special_body])
      end

      protected

      attr_reader :client
    end
  end
end
