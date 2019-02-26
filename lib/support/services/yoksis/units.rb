# frozen_string_literal: true

module Services
  module Yoksis
    class Units < Endpoint
      configure do |config|
        config.name     = 'units'
        config.url      = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'
        config.synopsis = 'YOKSIS `Üniversite Birimler` endpoint'
        config.version  = '4'
      end
    end
  end
end
