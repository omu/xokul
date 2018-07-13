# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      class References
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'

        def initialize
          @client = Client.new(WSDL_URL)
        end

        REFERENCES_METHODS.each do |name, action|
          define_method(name) { client.call(action) }
        end

        def district(province_code)
          client.call(:get_ilce_getir, ILKODU: province_code)
        end

        attr_reader :client
      end
    end
  end
end
