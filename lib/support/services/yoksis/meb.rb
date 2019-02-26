# frozen_string_literal: true

module Services
  module Yoksis
    class MEB < Endpoint
      configure do |config|
        config.name     = 'meb'
        config.url      = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'
        config.synopsis = 'YOKSIS MEB Mezun Sorgulama endpoint'
        config.version  = '2'
      end
    end
  end
end
