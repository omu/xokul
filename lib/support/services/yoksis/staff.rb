# frozen_string_literal: true

module Services
  module Yoksis
    class Staff < Endpoint
      configure do |config|
        config.name     = 'staff'
        config.url      = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'
        config.synopsis = 'YOKSIS `Akademik Personel` endpoint'
        config.version  = '1'
      end
    end
  end
end
