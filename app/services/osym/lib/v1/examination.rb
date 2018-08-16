# frozen_string_literal: true

module Services
  class Osym
    module V1
      class Examination
        WSDL_URL = 'https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl'

        def initialize(username, password)
          @client = Client.new(WSDL_URL)
          @client.basic_auth username, password
          @client.wsse_auth username, password
        end

        def groups
          client.request(operation: :sinav_grup_bilgilerini_getir)
        end

        def result(id_number, result_id)
          client.request(
            operation: :sinav_sonuc_xml,
            adayTcKimlikNo: id_number,
            sonucId: result_id
          )
        end

        def results(id_number, year, group_id)
          client.request(
            operation: :sinav_sonuclari_getir,
            adayTcKimlikNo: id_number,
            yil: year,
            grupId: group_id
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
