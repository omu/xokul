# frozen_string_literal: true

module Services
  module Yoksis
    class Students
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'

      def informations(id_number:)
        safe_request(__method__, args: { TC_KIMLIK_NO: id_number })
      end
    end
  end
end
