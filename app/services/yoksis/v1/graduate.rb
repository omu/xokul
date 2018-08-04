# frozen_string_literal: true

module Services
  module Yoksis
    module V1
      class Graduate
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'

        def initialize(client_id, client_secret)
          @client = Client.new(WSDL_URL)
          @client.basic_auth client_id, client_secret
        end

        def status(tck_no)
          client.call(METHODS[__method__], TCKNO: tck_no)
        end

        protected

        attr_reader :client
      end
    end
  end
end
