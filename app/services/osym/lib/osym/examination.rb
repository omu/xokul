# frozen_string_literal: true

module Services
  module Osym
    class Examination
      include SafeRequest

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

      protected

      attr_reader :client
    end
  end
end
