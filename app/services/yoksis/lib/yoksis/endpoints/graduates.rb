# frozen_string_literal: true

module Services
  module Yoksis
    class Graduates
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'

      def students(id_number:)
        safe_request(__method__, args: { TCKNO: id_number })
      end
    end
  end
end
