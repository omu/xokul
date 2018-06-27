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

      # Action: kullaniciyaGoreUniversitedeki_Akademik_Personel_Bilgisiv1
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

      # Action: kullaniciyaGoreTcKimlikNodan_Akademik_Personel_Bilgisiv1
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

      # Action: kullaniciyaGoreUniversiteki_Akademik_Personel_SayfaSayisiv1
      # Method: GET
      # Parameters: SORGULAYAN_TC_KIMLIK_NO
      def kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1(querier)
        client.call(
          __method__,
          message: { 'SORGULAYAN_TC_KIMLIK_NO' => querier }
        ).body
      end

      # Action: getMernisUyruk
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

      # Action: TcKimlikNoilMezunOgrenciSorgulav2
      # Method: GET
      # Parameters: TCKNO
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

      # Action: UniversiteleriGetirv4
      # Method: GET
      # Parameters: parameter not required
      def universiteleri_getirv4
        client.call(__method__)
      end

      # Action TarihtenBirimDegisiklikGetirv4
      # Method: GET
      # Parameters: GUN, AY, YIL
      def tarihten_birim_degisiklik_getirv4(day, month, year)
        client.call(
          __method__,
          message: { 'GUN' => day, 'AY' => month, 'YIL' => year }
        ).body
      end

      # Action: AltBirimdekiProgramlariGetirv4
      # Method: GET
      # Parameters: BIRIM_ID
      def alt_birimdeki_programlari_getirv4(unit_id)
        client.call(__method__, message: { 'BIRIM_ID' => unit_id }).body
      end

      # Action: AltBirimleriGetirv4
      # Method: GET
      # Parameters: BIRIM_ID
      alias alt_birimleri_getirv4 alt_birimdeki_programlari_getirv4

      # Action: IDdenBirimAdiGetirv4
      # Method: GET
      # Parameters: BIRIM_ID
      alias idden_birim_adi_getirv4 alt_birimdeki_programlari_getirv4
    end
  end

  # =>
  class ElektronikKayit
    WSDL_ENDPOINT = 'https://servisler.yok.gov.tr/ws/ekayitv1?wsdl'.freeze

    # YOKSIS ElektronikKayıt client
    @client = Client.new(
      WSDL_ENDPOINT,
      basic_auth: [ENV['YOKSIS_CLIENT_ID'], ENV['YOKSIS_CLIENT_SECRET']]
    )

    class << self
      attr_reader :client

      # Action: BelirtilenGunOnlineKayitOlanOgrencileriGetirv1
      # Method: GET
      # Parameters: GUN, AY, YIL, YOKSIS_UNIVERSITE_BIRIM_ID
      def belirtilen_gun_online_kayit_olan_ogrenciler_getirv1(day, month, year, unit_id)
        client.call(
          __method__,
          message: {
            'GUN' => day,
            'AY' => month,
            'YIL' => year,
            'YOKSIS_UNIVERSITE_BIRIM_ID' => unit_id
          }
        ).body
      end

      # Action: TcKimlikNoileOnlineKayitOgrenciBilgiGetirv1
      # Method: GET
      # Parameters: TCKN, YOKSIS_UNIVERSITE_BIRIM_ID
      def tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1(tc_no, unit_id)
        client.call(
          __method__,
          message: { 'TCKN' => tc_no, 'YOKSIS_UNIVERSITE_BIRIM_ID' => unit_id }
        ).body
      end

      # Action: VakifOgrenimUcretiv1
      # Method: GET
      # Parameters: TCKN, OGRENIM_UCRETI_ODENDI_MI
      def vakif_ogrenim_ucretiv1(tc_no, paid)
        client.call(
          __method__,
          message: { 'TCKN' => tc_no, 'OGRENIM_UCRETI_ODENDI_MI' => paid }
        ).body
      end
    end
  end

  # =>
  class OgrenciSorgulama
    WSDL_ENDPOINT = 'https://servisler.yok.gov.tr/ws/TcKimlikNoileOgrenciSorgulaDetayv4?WSDL'.freeze

    # YOKSIS ElektronikKayıt client
    @client = Client.new(
      WSDL_ENDPOINT,
      basic_auth: [ENV['YOKSIS_CLIENT_ID'], ENV['YOKSIS_CLIENT_SECRET']]
    )

    # Action: TcKimlikNoileOgrenciSorgulaDetayv4
    # Method: GET
    # Parameters: TC_KIMLIK_NO
    def self.tc_kimlik_noile_ogrenci_sorgula_detayv4(tc_no)
      @client.call(__method__, message: { 'TC_KIMLIK_NO' => tc_no })
    end
  end
end

def main
  pp YOKSIS::Referanslar.get_ogrenim_turu
  pp YOKSIS::AkademikPersonel.get_mernis_uyruk
  pp YOKSIS::MezunBilgileri.tc_kimlik_noil_mezun_ogrenci_sorgulav2(ENV['TEST_TC_NO'])
  pp YOKSIS::Birimler.universiteleri_getirv4
  pp YOKSIS::ElektronikKayit.vakif_ogrenim_ucretiv1(ENV['TEST_TC_NO'], false)
  pp YOKSIS::OgrenciSorgulama.tc_kimlik_noile_ogrenci_sorgula_detayv4(ENV['TEST_TC_NO'])
end

main if $PROGRAM_NAME == __FILE__
