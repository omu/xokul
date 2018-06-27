#!/usr/bin/env ruby

require 'logger'
require 'savon'

module KPS
  # =>
  class Public
    WSDL_ENDPOINT = 'https://tckimlik.nvi.gov.tr/Service/KPSPublic.asmx?WSDL'.freeze

    @client = Savon.client(
      wsdl: WSDL_ENDPOINT,
      encoding: 'UTF-8',
      log: Logger
    )

    def self.tc_kimlik_no_dogrula(tc_no, date_of_birth, firstname = '', lastname = '')
      @client.call(
        __method__,
        message: {
          'TCKimlikNo' => tc_no,
          'Ad' => firstname,
          'Soyad' => lastname,
          'DogumYili' => date_of_birth
        }
      ).body
    end
  end
end

def main
  pp KPS::Public.tc_kimlik_no_dogrula(ENV['TEST_TC_NO'], ENV['TEST_DATE_OF_BIRTH'])
end

main if $PROGRAM_NAME == __FILE__
