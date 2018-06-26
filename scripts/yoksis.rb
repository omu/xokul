#!/usr/bin/env ruby

require 'logger'
require 'savon'

module YOKSIS
  # Referanslar
  class Referanslar
    WSDL_ENDPOINT = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'.freeze

    # API client
    @client = Savon.client(
      wsdl: WSDL_ENDPOINT,
      encoding: 'UTF-8',
      log: Logger,
      convert_request_keys_to: 'camelcase'
    )

    class << self
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
        define_method("get_#{method}") { |args = {}| send_request(__method__, args) }
      end

      attr_reader :client

      def send_request(action_name, args)
        client.call(action_name, message: args).body
      end
    end
  end
end

def main
  pp YOKSIS::Referanslar.get_ogrenim_turu
end

main if $PROGRAM_NAME == __FILE__
