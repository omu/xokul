# frozen_string_literal: true

module Services
  class Detsis
    ENDPOINTS = [].freeze

    WSDL_URL = 'https://bbws.kaysis.gov.tr/DETSISServis.asmx?WSDL'

    # rubocop:disable Layout/LineLength
    ARGS = {
      active_kep_addresses:               {
        operation: :aktif_kep_adreslerini_getir,
        result:    %i[aktif_kep_adreslerini_getir_response aktif_kep_adreslerini_getir_result sonuclar kep_bilgileri_ws],
        status:    %i[aktif_kep_adreslerini_getir_response aktif_kep_adreslerini_getir_result sonuc_hatali]
      },
      officiers:                          {
        operation: :detsis_islem_yetkilisi_bilgileri_ws,
        result:    %i[detsis_islem_yetkilisi_bilgileri_ws_response detsis_islem_yetkilisi_bilgileri_ws_result sonuclar detsis_kullanici],
        status:    %i[detsis_islem_yetkilisi_bilgileri_ws_response detsis_islem_yetkilisi_bilgileri_ws_result sonuc_hatali]
      },
      parent_establishments_budget_types: {
        operation: :ana_kurumlar_butce_turleri_getir_ws,
        result:    %i[ana_kurumlar_butce_turleri_getir_ws_response ana_kurumlar_butce_turleri_getir_ws_result sonuclar ana_kurumlar_butce_turleri],
        status:    %i[ana_kurumlar_butce_turleri_getir_ws_response ana_kurumlar_butce_turleri_getir_ws_result sonuc_hatali]
      },
      parent_establishments_contacts:     {
        operation: :anakurum_iletisim_bilgileri_ws,
        result:    %i[anakurum_iletisim_bilgileri_ws_response anakurum_iletisim_bilgileri_ws_result sonuclar iletisim_bilgileri_ws],
        status:    %i[anakurum_iletisim_bilgileri_ws_response anakurum_iletisim_bilgileri_ws_result sonuc_hatali]
      },
      parent_establishments:              {
        operation: :ana_kurumlari_getir_kurum_birim_ws,
        result:    %i[ana_kurumlari_getir_kurum_birim_ws_response ana_kurumlari_getir_kurum_birim_ws_result sonuclar kurum_birim_ws],
        status:    %i[ana_kurumlari_getir_kurum_birim_ws_response ana_kurumlari_getir_kurum_birim_ws_result sonuc_hatali]
      },
      place_codes:                        {
        operation: :tum_yer_kodlari_getir_ws,
        result:    %i[tum_yer_kodlari_getir_ws_response tum_yer_kodlari_getir_ws_result sonuclar res_yer_kodlari],
        status:    %i[tum_yer_kodlari_getir_ws_response tum_yer_kodlari_getir_ws_result sonuc_hatali]
      },
      sdp_codes:                          {
        operation: :kurum_sdp_kodlari_getir_ws,
        result:    %i[kurum_sdp_kodlari_getir_ws_response kurum_sdp_kodlari_getir_ws_result sonuclar kodlar_ws_obj],
        status:    %i[kurum_sdp_kodlari_getir_ws_response kurum_sdp_kodlari_getir_ws_result sonuc_hatali]
      },
      type_one_codes:                     {
        operation: :tum_tip1_kodlari_getir_ws,
        result:    %i[tum_tip1_kodlari_getir_ws_response tum_tip1_kodlari_getir_ws_result sonuclar res_kurum_birim_tipleri1],
        status:    %i[tum_tip1_kodlari_getir_ws_response tum_tip1_kodlari_getir_ws_result sonuc_hatali]
      },
      type_two_codes:                     {
        operation: :tum_tip2_kodlari_getir_ws,
        result:    %i[tum_tip2_kodlari_getir_ws_response tum_tip2_kodlari_getir_ws_result sonuclar res_kurum_birim_tipleri2],
        status:    %i[tum_tip2_kodlari_getir_ws_response tum_tip2_kodlari_getir_ws_result sonuc_hatali]
      },
      units:                              {
        operation: :kendi_tum_birimleri_getir_ws,
        result:    %i[kendi_tum_birimleri_getir_ws_response kendi_tum_birimleri_getir_ws_result sonuclar kurum_birim_ws],
        status:    %i[kendi_tum_birimleri_getir_ws_response kendi_tum_birimleri_getir_ws_result sonuc_hatali]
      }
    }.freeze
    # rubocop:enable Layout/LineLength

    def initialize(username, password)
      @client = Client.new(WSDL_URL)
      @client.add_namespace 'xmlns:kay', 'http://kaysis.gov.tr/'
      @client.add_soap_header(
        'kay:BbServiceAuthentication',
        'kay:KurumID'  => username,
        'kay:Password' => password
      )
    end

    ARGS.keys.each do |method|
      define_method(method) do
        next if method.eql?(:sdp_codes)

        @response = client.request(ARGS.dig(method, :operation))

        raise InvalidResponseError if response_has_error?(method)
        raise NoContentError unless response_has_body?(method)

        result(method)
      end
    end

    def sdp_codes(administrative_identity_code)
      @response = client.request(
        ARGS.dig(:sdp_codes, :operation), args: { IdariKimlikKodu: administrative_identity_code }
      )

      raise InvalidResponseError if response_has_error?(:sdp_codes)
      raise NoContentError unless response_has_body?(:sdp_codes)

      result(:sdp_codes)
    end

    def sdp_code_references
      references = Sensitive.read('db/encrypted_data/sdp_codes.json')
      JSON.parse(references)
    end

    private

    def response_has_error?(method)
      @response.dig(*ARGS.dig(method, :status)).eql?('false')
    end

    def response_has_body?(method)
      @response.dig(*ARGS.dig(method, :result), &:present?)
    end

    def result(method)
      @response.dig(*ARGS.dig(method, :result))
    end

    protected

    attr_reader :client
  end
end
