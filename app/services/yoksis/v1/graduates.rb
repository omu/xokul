# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      class Graduates
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'

        def initialize(client_id, client_secret)
          @client = Client.new(WSDL_URL)
          @client.basic_auth client_id, client_secret
        end

        def status(tck_no)
          client.call(GRADUATES_METHODS[__method__], TCKNO: tck_no)
        end

        attr_reader :client
      end
    end
  end
end
