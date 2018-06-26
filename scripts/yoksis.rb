#!/usr/bin/env ruby

require 'forwardable'
require 'logger'
require 'savon'

module YOKSIS
  # =>
  class Client
    extend Forwardable
    def_delegators :@client, :call

    def initialize(endpoint, **extra_args)
      @client = Savon.client(
        wsdl: endpoint,
        encoding: 'UTF-8',
        log: Logger,
        convert_request_keys_to: 'camelcase', **extra_args
      )
    end
  end

  # =>
  class Referanslar
    WSDL_ENDPOINT = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'.freeze

    # YOKSIS Referanslar client
    @client = Client.new(WSDL_ENDPOINT)

    class << self
      # [All methods have 'get' prefix]
      #
      # Method: GET (all)
      # Parameters: ILKODU (string) - "ilce_getir" method
      %i[
        aktiflik_durumu
        birim_turu
        ceza_turu
        giris_turu
        idari_birimler
        il_getir
        ilce_getir
        kadro_gorev_unvan
        kod_bid
        mernis_cinsiyet
        mernis_ulke
        mernis_uyruk
        ogrenci_ayrilma_nedeni
        ogrenci_diploma_not_sistemi
        ogrenci_doykm
        ogrenci_engel_turu
        ogrenci_sehit_gazi_yakini
        ogrenci_giris_puan_turu
        ogrenci_giris_turu
        ogrencilik_statusu
        ogrenci_ogrencilik_hakki
        ogrenci_sinif
        ogrenim_dili
        ogrenim_turu
        personel_gorev
        universite_turu
      ].each do |method|
        define_method("get_#{method}") { |args = {}| client.call(__method__, args) }
      end

      attr_reader :client
    end
  end

  # =>
  class AkademikPersonel
    WSDL_ENDPOINT = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'.freeze

    # YOKSIS Referanslar client
    @client = Client.new(
      WSDL_ENDPOINT,
      basic_auth: [ENV['YOKSIS_USERNAME'], ENV['YOKSIS_PASSWORD']]
    )

    class << self
      attr_reader :client

      # Method: GET
      # Parameters: SAYFA, SORGULAYAN_TC_KIMLIK_NO
      def kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1(page, querier)
        client.call(
          __method__,
          message: {
            'SAYFA' => page,
            'SORGULAYAN_TC_KIMLIK_NO' => querier
          }
        ).body
      end

      # Method: GET
      # Parameters: AKPER_TC_KIMLIK_NO, SORGULAYAN_TC_KIMLIK_NO
      def kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1(queried, querier)
        client.call(
          __method__,
          message: {
            'AKPER_TC_KIMLIK_NO' => queried,
            'SORGULAYAN_TC_KIMLIK_NO' => querier
          }
        ).body
      end

      # Method: GET
      # Parameters: SORGULAYAN_TC_KIMLIK_NO - identity number
      def kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1(querier)
        client.call(
          __method__,
          message: { 'SORGULAYAN_TC_KIMLIK_NO' => querier }
        ).body
      end

      # Method: GET
      # Parameters: parameter not required
      def get_mernis_uyruk
        client.call(__method__).body
      end
    end
  end

  # =>
  class MezunBilgileri
    WSDL_ENDPOINT = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileMezunOgrenciSorgulav2?WSDL'.freeze

    # YOKSIS MezunBilgileri client
    @client = Client.new(
      WSDL_ENDPOINT,
      basic_auth: [
        ENV['YOKSIS_CLIENT_ID'], ENV['YOKSIS_CLIENT_SECRET']
      ]
    )

    class << self
      attr_reader :client

      # Method: GET
      # Parameters: TCKNO - queried id number
      def tc_kimlik_noil_mezun_ogrenci_sorgulav2(tc_no)
        client.call(__method__, message: { 'TCKNO' => tc_no }).body
      end
    end
  end

  # =>
  class Birimler
    WSDL_ENDPOINT = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'.freeze

    # YOKSIS Birimler client
    @client = Client.new(WSDL_ENDPOINT)

    class << self
      attr_reader :client

      # Method: GET
      # Parameters: parameter not required
      def universiteleri_getirv4
        client.call(__method__)
      end

      # Method: GET
      # Parameters: GUN, AY, YIL
      def tarihten_birim_degisiklik_getirv4(day, month, year)
        client.call(
          __method__,
          message: { 'GUN' => day, 'AY' => month, 'YIL' => year }
        ).body
      end

      # Method: GET
      # Parameters: BIRIM_ID
      def alt_birimdeki_programlari_getirv4(unit_id)
        client.call(__method__, message: { 'BIRIM_ID' => unit_id }).body
      end

      alias alt_birimleri_getirv4 alt_birimdeki_programlari_getirv4
      alias idden_birim_adi_getirv4 alt_birimdeki_programlari_getirv4
    end
  end
end

def main
  pp YOKSIS::Referanslar.get_ogrenim_turu
  pp YOKSIS::AkademikPersonel.get_mernis_uyruk
  pp YOKSIS::MezunBilgileri.tc_kimlik_noil_mezun_ogrenci_sorgulav2(ENV['TEST_TC_NO'])
  pp YOKSIS::Birimler.universiteleri_getirv4
end

main if $PROGRAM_NAME == __FILE__
