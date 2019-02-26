# frozen_string_literal: true

module Services
  module Yoksis
    class Graduates < Endpoint
      configure do |config|
        config.synopsis = 'YOKSIS Mezun Sorgulama endpoint'
        config.version  = '2'
        config.url      = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'
      end
    end
  end
end
