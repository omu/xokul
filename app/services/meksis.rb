# frozen_string_literal: true

module Services
  module Meksis
    module_function

    def administrative_departments
      Connection.request 'AkademikIdariBolumListesi'
    end

    def administrative_units
      Connection.request 'AkademikIdariBirimListesi'
    end

    def buildings
      buildings = Sensitive.read('db/encrypted_data/buildings.json')
      JSON.parse(buildings)
    end

    def characteristics
      Connection.request 'KarakteristikListesi'
    end

    def classrooms(building_id)
      Connection.request 'DerslikListesi', binaid: building_id
    end

    def departments(unit_id)
      Connection.request 'AkademikIdariBirimeGoreBolumListesi', akademikbirimid: unit_id
    end

    def main_place_types
      Connection.request 'AnaFonksiyonListesi'
    end

    def sub_place_types
      Connection.request 'AltFonksiyonListesi'
    end

    def syllabuses(syllabus_id)
      Connection.request 'DersProgramiListesi', dersprogramid: syllabus_id
    end

    def syllabuses_by_classroom(classroom_id, year, term)
      Connection.request 'DerslikDersProgramiListesi', derslikid: classroom_id, yil: year, donem: term
    end

    def syllabuses_by_department(unit_id, year, term)
      Connection.request 'AkademikBolumeGoreDersProgramiListesi', akademikidaribolumid: unit_id, yil: year, donem: term
    end

    def syllabuses_by_unit(unit_id, year, term)
      Connection.request 'AkademikBirimeGoreDersProgramiListesi', akademikidaribirimid: unit_id, yil: year, donem: term
    end

    module Connection
      WSDL_URL = 'https://meksis.gov.tr/Services/meksisservice.svc/rest'
      HEADER   = {
        'Accept':        'application/json',
        'Content-Type':  'application/json',
        'Authorization': "Basic #{Rails.application.credentials.meksis[:basic_auth]}"
      }.freeze
      PARAMS = {
        universiteid: Rails.application.credentials.meksis[:university_id].to_i,
        kullanici:    Rails.application.credentials.meksis[:username],
        sifre:        Rails.application.credentials.meksis[:password]
      }.freeze

      module_function

      def request(operation, **args)
        resp = RestClient.post(
          "#{WSDL_URL}/#{operation}Rest",
          header: HEADER, payload: PARAMS.merge(args).to_json, use_ssl: true
        )

        resp.error!

        JSON.parse(resp.decode["#{operation}RestResult"])
      end
    end

    private_constant :Connection
  end
end
