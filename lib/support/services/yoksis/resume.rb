# frozen_string_literal: true

module Services
  module Yoksis
    class Resume < Endpoint
      configure do |config|
        config.name     = 'resume'
        config.url      = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'
        config.synopsis = 'YOKSIS Özgeçmiş endpoint'
        config.version  = '2'
      end
    end
  end
end
