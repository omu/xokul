# frozen_string_literal: true

module Yoksis
  module Prospectives
    class StudentsSerializer < Serializer
      attribute(:data) do
        object[:data].map do |o|
          nationality = 'turkish' if o[:uyrukTc] == 1
          nationality = 'kktc'    if o[:uyrukKktc] == 1
          nationality = 'foreign' if o[:uyrukYabanci] == 1

          {
            id_number:                       integer(o[:tcKimlikNo]),
            first_name:                      string(o[:adi]),
            last_name:                       string(o[:soyadi]),
            fathers_name:                    string(o[:babaAdi]),
            mothers_name:                    string(o[:anneAdi]),
            gender:                          (o[:cinsiyet].eql?('Erkek') ? 'male' : 'female'),
            date_of_birth:                   parse_date(o[:dogumTarihi]),
            nationality:                     nationality,
            place_of_birth:                  string(o[:dogumYer]),
            registration_city:               string(o[:nufusIl]),
            registration_district:           string(o[:nufusIlce]),
            high_school_code:                string(o[:okulKodu]),
            high_school_type:                string(o[:okulTuru]),
            high_school_branch:              string(o[:okulKolu]),
            high_school_graduation_year:     integer(o[:ortaOgrenimMezuniyet]),
            state_of_education:              integer(o[:ogrenimDurumu]),
            placement_type:                  (o[:yerlesmeTuru].eql?('Genel') ? 'general' : 'additional_score'),
            placement_score:                 float(o[:yerKullanilanPuani]),
            placement_score_type:            string(o[:yerlestigiPuanTuru]).upcase,
            placement_rank:                  integer(o[:yerKullanilanBasariSirasi]),
            address:                         string(o[:adres]),
            home_phone:                      string(o[:evTel]),
            mobile_phone:                    string(o[:cepTel]),
            email:                           string(o[:eposta])&.downcase,
            top_student:                     boolean(o[:okulBirinci] == 1 ? true : false),
            university_code:                 string(o[:universiteKodu]),
            university_name:                 string(o[:universiteAdi]),
            faculty_name:                    o[:fakulteAdi],
            program_code:                    string(o[:programKodu]),
            program_name:                    string(o[:programAdi]),
            preference_order:                integer(o[:tercihSirasi]),
            quota:                           string(o[:kontenjan]),
            exam_score:                      float(o[:basariPuani]),
            meb_status:                      boolean(o[:mebDurum] == 1 ? true : false),
            meb_status_date:                 parse_datetime(o[:mebSorgulamaTarihi]),
            military_status:                 boolean(o[:asalDurum] == 101 ? true : false),
            military_status_date:            parse_datetime(o[:asalSorgulamaTarihi]),
            obs_status:                      boolean(o[:obsKontrol] == 1 ? false : true),
            obs_status_date:                 parse_datetime(o[:obsKontrolSorgulamaTarihi]),
            prep_class_status:               boolean(o[:ibHazirlikSinifi] == 1 ? true : false),
            current_program:                 string(o[:okuduguProgram]),
            online_registration_term_code:   string(o[:ekayitDonemId]),
            online_registration_term_name:   o[:ekayitDonemAdi],
            online_registration_term_type:   string(o[:ekayitDonemTuru]).upcase,
            online_registration_permit_code: integer(o[:ekayitIzin]),
            online_registration_permit_date: parse_datetime(o[:ekayitTarihi])
          }
        end
      end
      attribute(:meta) { object[:meta] }
    end
  end
end
