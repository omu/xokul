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
      # Parameters: il_kodu (string) - "ilce_getir" method
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
      # Parameters: page - page number, querier - identity number
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
      # Parameters: queried - identity number, querier - identity number
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
      # Parameters: querier - identity number
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
end

def main
  pp YOKSIS::Referanslar.get_ogrenim_turu
  pp YOKSIS::AkademikPersonel.get_mernis_uyruk
end

main if $PROGRAM_NAME == __FILE__
