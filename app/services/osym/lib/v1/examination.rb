# frozen_string_literal: true

module Services
  class Osym
    module V1
      class Examination
        WSDL_URL = 'https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl'

        def initialize(username, password)
          @client = Support::Client.new(WSDL_URL)
          @client.basic_auth username, password
          @client.wsse_auth username, password
        end

        def groups
          client.request(:sinav_grup_bilgilerini_getir)
        end

        def result(tck_no, result_id)
          client.request(
            :sinav_sonuc_xml, adayTcKimlikNo: tck_no, sonucId: result_id
          )
        end

        def results(tck_no, year, group_id)
          client.request(
            :sinav_sonuclari_getir,
            adayTcKimlikNo: tck_no, yil: year, grupId: group_id
          )
        end

        protected

        attr_reader :client
      end
    end
  end
end
