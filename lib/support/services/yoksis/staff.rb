# frozen_string_literal: true

module Services
  module Yoksis
    class Staff < Endpoint
      configure do |config|
        config.synopsis = 'YOKSIS Akademik Personel endpoint'
        config.version  = '1'
        config.url      = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'
      end
    end
  end
end
