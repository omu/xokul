# frozen_string_literal: true

module Services
  module Meksis
    module_function

    def main_functionalities
      Connection.request 'AnaFonksiyonListesi'
    end

    def sub_functionalities
      Connection.request 'AltFonksiyonListesi'
    end
    
    def buildings
      Connection.request 'BinaListesi'
    end

    module Connection
      WSDL_URL = 'https://meksis.gov.tr/Services/meksisservice.svc/rest'
      HEADER   = {
        'Accept':        'application/json',
        'Content-Type':  'application/json',
        'Authorization': "Basic #{Rails.application.credentials.meksis[:basic_auth]}"
      }.freeze
      PARAMS   = {
        universiteid: Rails.application.credentials.meksis[:university_id].to_i,
        kullanici:    Rails.application.credentials.meksis[:username],
        sifre:        Rails.application.credentials.meksis[:password]
      }.freeze

      module_function

      def request(operation)
        resp = RestClient.post(
          "#{WSDL_URL}/#{operation}Rest",
          header: HEADER, payload: PARAMS.to_json, use_ssl: true
        )

        resp.error!

        JSON.parse(resp.decode["#{operation}RestResult"])
      end
    end
  end
end
