# frozen_string_literal: true

module Yoksis
  module Prospectives
    class StudentsSerializer < Serializer
      attribute(:data) do
        object[:data].map do |o|
          {
            id_number:                       integer(o[:tcKimlikNo]),
            first_name:                      string(o[:adi]),
            last_name:                       string(o[:soyadi]),
            fathers_name:                    string(o[:babaAdi]),
            mothers_name:                    string(o[:anneAdi]),
            gender:                          string(o[:cinsiyet]),
            date_of_birth:                   parse_date(o[:dogumTarihi]),
            turkish_citizen:                 boolean(o[:uyrukTc] == 1 ? true : false),
            kktc_citizen:                    boolean(o[:uyrukKktc] == 1 ? true : false),
            foreign_national:                boolean(o[:uyrukYabanci] == 1 ? true : false),
            place_of_birth:                  string(o[:dogumYer]),
            registered_city:                 string(o[:nufusIl]),
            registered_district:             string(o[:nufusIlce]),
            high_school_code:                string(o[:okulKodu]),
            high_school_type:                string(o[:okulTuru]),
            high_school_branch:              string(o[:okulKolu]),
            state_of_education:              integer(o[:ogrenimDurumu]),
            high_school_graduation_year:     integer(o[:ortaOgrenimMezuniyet]),
            placement_type:                  string(o[:yerlesmeTuru]),
            high_school_gpa:                 float(o[:basariPuani]),
            full_address:                    string(o[:adres]),
            city_code:                       integer(o[:adresIl]),
            district:                        string(o[:semtIlce]),
            home_phone:                      string(o[:evTel]),
            mobile_phone:                    string(o[:cepTel]),
            email:                           string(o[:eposta]),
            top_scoring_student:             boolean(o[:okulBirinci] == 1 ? true : false),
            placement_score:                 float(o[:yerKullanilanPuani]),
            placement_ranking:               integer(o[:yerKullanilanBasariSirasi]),
            university_code:                 string(o[:universiteKodu]),
            university_name:                 string(o[:universiteAdi]),
            faculty_name:                    string(o[:fakulteAdi]),
            program_code:                    string(o[:programKodu]),
            program_name:                    string(o[:programAdi]),
            order_of_choice:                 integer(o[:tercihSirasi]),
            placement_point_type:            string(o[:yerlestigiPuanTuru]),
            quota:                           string(o[:kontenjan]),
            meb_status_code:                 integer(o[:mebDurum]),
            meb_status_name:                 string(o[:mebDurumAciklama]),
            meb_last_query_date:             parse_datetime(o[:mebSorgulamaTarihi]),
            asal_status_code:                string(o[:asalDurum]),
            asal_status_name:                string(o[:asalDurumAciklama]),
            asal_last_query_date:            parse_datetime(o[:asalSorgulamaTarihi]),
            obs_status_code:                 string(o[:obsKontrol]),
            obs_last_query_date:             parse_datetime(o[:obsKontrolSorgulamaTarihi]),
            active_program:                  string(o[:okuduguProgram]),
            online_registration_term_id:     integer(o[:ekayitDonemId]),
            online_registration_term_name:   string(o[:ekayitDonemAdi]),
            online_registration_term_type:   string(o[:ekayitDonemTuru]),
            prep_class_code:                 integer(o[:ibHazirlikSinifi]),
            online_registration_permit_code: integer(o[:ekayitIzin]),
            online_registration_permit_date: parse_datetime(o[:ekayitTarihi])
          }
        end
      end
      attribute(:meta) { object[:meta] }
    end
  end
end
