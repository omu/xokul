# frozen_string_literal: true

module Services
  module Yoksis
    class References
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'

      METHOD_VARIABLES.each_key do |method|
        define_method(method) { safe_request(method) }
      end

      def districts(city_code:)
        safe_request(__method__, args: { ILKODU: city_code })
      end
    end
  end
end
