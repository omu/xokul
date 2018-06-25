#!/usr/bin/env ruby

require 'logger'
require 'savon'

# OSYM
class OSYM
  attr_reader :client

  # OSYM VPS endpoint
  WSDL_ENDPOINT = 'https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl'.freeze

  def initialize(user, password)
    @client = Savon.client(
      wsdl: WSDL_ENDPOINT,
      encoding: 'UTF-8',
      log: Logger,
      basic_auth: [user, password]
    )
  end

  def sonuc(tc_no = '', sonuc_id = '')
    client.call(
      :sinav_sonuc_xml,
      message: { 'adayTcKimlikNo' => tc_no, 'sonucId' => sonuc_id }
    )
  end
end

def main
  osym = OSYM.new(ENV['OSYM_USERNAME'], ENV['OSYM_PASSWORD'])
  p osym.sonuc(ENV['TEST_TC_NO'])
end

main if $PROGRAM_NAME == __FILE__
