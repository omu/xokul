# frozen_string_literal: true

module Services
  module Yoksis
    module V1
      class Student
        WSDL_URL = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'

        def initialize(username, password)
          @client = Client.new(WSDL_URL)
          @client.basic_auth username, password
        end

        def detailed(tck_no)
          client.call(STUDENT_METHODS[__method__], TC_KIMLIK_NO: tck_no)
        end

        attr_reader :client
      end
    end
  end
end
