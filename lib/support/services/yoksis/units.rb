# frozen_string_literal: true

module Services
  module Yoksis
    class Units < Endpoint
      configure do |config|
        config.synopsis = 'YOKSIS Üniversite Birimler endpoint'
        config.version  = '4'
        config.url      = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'
      end
    end
  end
end
