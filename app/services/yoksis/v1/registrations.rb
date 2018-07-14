# frozen_string_literal: true

module Services
  module Yoksis
    module V1
      class Registrations
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/ekayitv1?wsdl'

        def initialize(username, password)
          @client = Client.new(WSDL_URL)
          @client.basic_auth username, password
        end

        def foundation_tuition(tck_no, paid)
          client.call(
            REGISTRATIONS_METHODS[__method__],
            TCKN: tck_no, OGRENIM_UCRETI_ODENDI_MI: paid
          )
        end

        def query_according_to_specific_day(day, month, year, unit_id)
          client.call(
            REGISTRATIONS_METHODS[__method__],
            GUN: day,
            AY: month,
            YIL: year,
            YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
          )
        end

        def query_with_tck(tck_no, unit_id)
          client.call(
            REGISTRATIONS_METHODS[__method__],
            TCKN: tck_no, YOKSIS_UNIVERSITE_BIRIM_ID: unit_id
          )
        end

        attr_reader :client
      end
    end
  end
end
