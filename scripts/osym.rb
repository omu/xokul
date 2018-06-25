#!/usr/bin/env ruby

require 'logger'
require 'savon'

# OSYM
class OSYM
  attr_reader :client

  # OSYM VPS endpoint
  WSDL_ENDPOINT = 'https://vps.osym.gov.tr/Ext/Provider/BilgiServisi/Sonuc?wsdl'.freeze

  def initialize(username, password)
    @client = Savon.client(
      wsdl: WSDL_ENDPOINT,
      encoding: 'UTF-8',
      log: Logger,
      basic_auth: [username, password],
      wsse_auth: [username, password]
    )
  end

  # Action: SinavSonuclariGetir
  # Method: GET
  # Paraleters: adayTcKimlikNo (optional), Yil (optional), grupId (optional)
  def sinav_sonuclari_getir(tc_no = '', yil = '', grup_id = '')
    client.call(
      :sinav_sonuclari_getir,
      message: { adayTcKimlikNo: tc_no, yil: yil, grupId: grup_id }
    )
  end

  # Action: SinavSonucHtml
  # Method: GET
  # Paraleters: adayTcKimlikNo (optional), sonucId (optional)
  def sinav_sonuc_html(tc_no = '', sonuc_id = '')
    client.call(
      :sinav_sonuc_html,
      message: { adayTcKimlikNo: tc_no, sonucId: sonuc_id }
    )
  end

  # Action: SinavSonucXml
  # Method: GET
  # Paraleters: adatTcKimlikNo (optional), sonucId (optional)
  def sinav_sonuc_xml(tc_no = '', sonuc_id = '')
    client.call(
      :sinav_sonuc_xml,
      message: { adayTcKimlikNo: tc_no, sonucId: sonuc_id }
    )
  end

  # Action: SinavGrupBilgileriniGetir
  # Method: GET
  def sinav_grup_bilgilerini_getir
    client.call(:sinav_grup_bilgilerini_getir)
  end
end

def main
  osym = OSYM.new(ENV['OSYM_USERNAME'], ENV['OSYM_PASSWORD'])

  # Tests
  pp osym.sinav_sonuc_xml(ENV['TEST_TC_NO'], ENV['TEST_SONUC_ID'])
  pp osym.sinav_grup_bilgilerini_getir
end

main if $PROGRAM_NAME == __FILE__
