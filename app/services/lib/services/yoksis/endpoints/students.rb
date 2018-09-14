# frozen_string_literal: true

module Services
  module Yoksis
    class Students
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'

      def informations(id_number:)
        r = safe_request(__method__, args: { TC_KIMLIK_NO: id_number })
        [r].flatten.first[:kisisel_bilgiler][:tc_kimlik_no] ? r : nil
      end
    end
  end
end
