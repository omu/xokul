# frozen_string_literal: true

module Services
  module Yoksis
    module V1
      class Staff
        WSDL_URL = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'

        def initialize(username, password)
          @client = Client.new(WSDL_URL)
          @client.basic_auth username, password
        end

        def information(page, querier)
          client.call(
            STAFF_METHODS[__method__],
            PAGE: page, SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        def information_by_tck(queried, querier)
          client.call(
            STAFF_METHODS[__method__],
            AKPER_TC_KIMLIK_NO: queried, SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        def nationalities
          client.call(STAFF_METHODS[__method__])
        end

        def page_number(querier)
          client.call(
            STAFF_METHODS[__method__], SORGULAYAN_TC_KIMLIK_NO: querier
          )
        end

        attr_reader :client
      end
    end
  end
end
