# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      class Staff
        WSDL_URL = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'

        def initialize(username, password)
          @client = Client.new(WSDL_URL)
          @client.basic_auth username, password
        end

        def nationalities
          client.call(STAFFS_METHODS[__method__])
        end

        attr_reader :client
      end
    end
  end
end
