# frozen_string_literal: true

module Services
  module Yoksis
    class Resume < Endpoint
      configure do |config|
        config.synopsis = 'YOKSIS Özgeçmiş endpoint'
        config.version  = '2'
        config.url      = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'
      end
    end
  end
end
