# frozen_string_literal: true

module Services
  class Detsis
    ENDPOINTS = [].freeze

    WSDL_URL = 'https://bbws.kaysis.gov.tr/DETSISServis.asmx?WSDL'

    RESPONSE_PATH = %i[
      kendi_tum_birimleri_getir_ws_response
      kendi_tum_birimleri_getir_ws_result
      sonuclar
      kurum_birim_ws
    ].freeze

    ERROR_PATH = %i[
      kendi_tum_birimleri_getir_ws_response
      kendi_tum_birimleri_getir_ws_result
      sonuc_hatali
    ].freeze

    private_constant :RESPONSE_PATH, :ERROR_PATH

    def initialize(username, password)
      @client = Client.new(WSDL_URL)
      @client.add_namespace 'xmlns:kay', 'http://kaysis.gov.tr/'
      @client.add_soap_header(
        'kay:BbServiceAuthentication',
        'kay:KurumID' => username,
        'kay:Password' => password
      )
    end

    def units
      response = client.request(:kendi_tum_birimleri_getir_ws)

      raise InvalidResponseError if response.dig(*ERROR_PATH)
      raise NoContentError unless response.dig(*RESPONSE_PATH, &:present?)

      response.dig(*RESPONSE_PATH)
    end

    protected

    attr_reader :client
  end
end