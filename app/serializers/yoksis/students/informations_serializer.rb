# frozen_string_literal: true

module Yoksis
  module Students
    class InformationsSerializer < Serializer
      attribute :personal_informations do
        informations = object[:kisisel_bilgiler]
        next unless informations[:tc_kimlik_no]

        {
          id_number:         integer(informations[:tc_kimlik_no]),
          first_name:        string(informations[:adi]),
          last_name:         string(informations[:soyadi]),
          fathers_name:      string(informations[:baba_adi]),
          mothers_name:      string(informations[:anne_adi]),
          date_of_birth:     build_date(*informations[:dogum_tarihi].values_at(:yil, :ay, :gun)),
          nationality: {
            code:            integer(informations.dig(:uyrugu, :kod)),
            name:            string(informations.dig(:uyrugu, :ad))
          },
          gender: {
            code:            integer(informations.dig(:cinsiyeti, :kod)),
            name:            string(informations.dig(:cinsiyeti, :ad))
          }
        }
      end

      attribute :studentship_informations do
        informations = object[:ogrencilik_bilgileri]
        next unless informations[:kayit_tarihi]

        {
          student_number:    integer(informations[:ogrenci_no]),
          entrance_point:    float(informations[:giris_puani]),
          current_term:      integer(informations[:aktif_donem_no]),
          ects:              float(informations[:akts]),
          prep_term:         integer(informations[:kac_donem_hazirlik]),
          registration_date: build_datetime(*informations[:kayit_tarihi].values_at(:yil, :ay, :gun, :saat, :dakika, :saniye)),
          prep_class: {
            code:            integer(informations.dig(:hazirlik_sinifi, :kod)),
            name:            string(informations.dig(:hazirlik_sinifi, :ad))
          },
          entrance_point_type: {
            code:            integer(informations.dig(:giris_puan_turu, :kod)),
            name:            string(informations.dig(:giris_puan_turu, :ad), ->(p) { p.upcase :turkic })
          },
          entrance_type: {
            code:            integer(informations.dig(:giris_turu, :kod)),
            name:            string(informations.dig(:giris_turu, :ad), ->(p) { p.upcase :turkic })
          },
          rights: {
            code:            integer(informations.dig(:ogrencilik_hakki_varmi, :kod)),
            name:            string(informations.dig(:ogrencilik_hakki_varmi, :ad))
          },
          end_date_of_studentship_right: build_date(*informations[:ogrencilik_hakki_bitti_tarih].values_at(:yil, :ay, :gun)),
          status: {
            code:            integer(informations.dig(:ogrencilik_statusu, :kod)),
            name:            string(informations.dig(:ogrencilik_statusu, :ad))
          },
          disability_type: {
            code:            integer(informations.dig(:engel_turu, :kod)),
            name:            string(informations.dig(:engel_turu, :ad))
          },
          disability_rate:   integer(informations[:engel_orani]),
          dropout_type: {
            code:            integer(informations.dig(:ayrilma_nedeni, :kod)),
            name:            string(informations.dig(:ayrilma_nedeni, :ad))
          },
          dropout_date:      build_date(*informations[:ayrilma_tarihi].values_at(:yil, :ay, :gun)),
          martyrs_relative: {
            code:            integer(informations.dig(:gazi_sehit_yakini, :kod)),
            name:            string(informations.dig(:gazi_sehit_yakini, :ad))
          },
          diploma: {
            gpa:             float(informations.dig(:diploma, :notu)),
            grading_system:  float(informations.dig(:diploma, :not_sistemi)),
            no:              integer(informations.dig(:diploma, :no))
          }
        }
      end

      attribute :unit_informations do
        informations = object[:birim]
        next unless informations.dig(:birim, :kod)

        {
          long_name:         string(informations[:birim_uzun_adi]),
          english_name:      string(informations[:birim_adi_ingilizce], ->(p) { p.titleize }, titleize_turkish: false),
          parent_unit_id:    integer(informations[:bagli_oldugu_birim_id]),
          period_of_study:   integer(informations[:ogrenim_suresi]),
          osym_id:           integer(informations[:kilavuz_kodu]),
          university: {
            code:            integer(informations.dig(:universite, :kod)),
            name:            string(informations.dig(:universite, :ad))
          },
          university_type: {
            code:            integer(informations.dig(:universite_turu, :kod)),
            name:            string(informations.dig(:universite_turu, :ad))
          },
          unit: {
            code:            integer(informations.dig(:birim, :kod)),
            name:            string(informations.dig(:birim, :ad))
          },
          unit_type: {
            code:            integer(informations.dig(:birim_turu, :kod)),
            name:            string(informations.dig(:birim_turu, :ad))
          },
          faculty: {
            code:            integer(informations.dig(:fakulte_yo_myo_enstitu, :kod)),
            name:            string(informations.dig(:fakulte_yo_myo_enstitu, :ad))
          },
          status: {
            code:            integer(informations.dig(:aktiflik, :kod)),
            name:            string(informations.dig(:aktiflik, :ad))
          },
          instruction_language: {
            code:            integer(informations.dig(:ogrenim_dili, :kod)),
            name:            string(informations.dig(:ogrenim_dili, :ad))
          },
          instruction_type: {
            code:            integer(informations.dig(:ogrenim_turu, :kod)),
            name:            string(informations.dig(:ogrenim_turu, :ad))
          },
          city: {
            code:            integer(informations.dig(:il, :kod)),
            name:            string(informations.dig(:il, :ad))
          },
          district: {
            code:            integer(informations.dig(:ilce, :kod)),
            name:            string(informations.dig(:ilce, :ad))
          }
        }
      end

      attribute :undergrad_transfer_informations do
        informations = object[:ygecis_birim_id]
        next unless informations.dig(:universite, :kod)

        {
          long_name:         string(informations[:birim_uzun_adi]),
          english_name:      string(informations[:birim_adi_ingilizce], ->(p) { p.titleize }, titleize_turkish: false),
          parent_unit_id:    integer(informations[:bagli_oldugu_birim_id]),
          period_of_study:   integer(informations[:ogrenim_suresi]),
          osym_id:           integer(informations[:kilavuz_kodu]),
          university: {
            code:            integer(informations.dig(:universite, :kod)),
            name:            string(informations.dig(:universite, :ad))
          },
          university_type: {
            code:            integer(informations.dig(:universite_turu, :kod)),
            name:            string(informations.dig(:universite_turu, :ad))
          },
          unit: {
            code:            integer(informations.dig(:birim, :kod)),
            name:            string(informations.dig(:birim, :ad))
          },
          unit_type: {
            code:            integer(informations.dig(:birim_turu, :kod)),
            name:            string(informations.dig(:birim_turu, :ad))
          },
          faculty: {
            code:            integer(informations.dig(:fakulte_yo_myo_enstitu, :kod)),
            name:            string(informations.dig(:fakulte_yo_myo_enstitu, :ad))
          },
          status: {
            code:            integer(informations.dig(:aktiflik, :kod)),
            name:            string(informations.dig(:aktiflik, :ad))
          },
          instruction_language: {
            code:            integer(informations.dig(:ogrenim_dili, :kod)),
            name:            string(informations.dig(:ogrenim_dili, :ad))
          },
          instruction_type: {
            code:            integer(informations.dig(:ogrenim_turu, :kod)),
            name:            string(informations.dig(:ogrenim_turu, :ad))
          },
          city: {
            code:            integer(informations.dig(:il, :kod)),
            name:            string(informations.dig(:il, :ad))
          },
          district: {
            code:            integer(informations.dig(:ilce, :kod)),
            name:            string(informations.dig(:ilce, :ad))
          }
        }
      end
    end
  end
end
