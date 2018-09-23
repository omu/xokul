# frozen_string_literal: true

module Yoksis
  module Students
    class InformationsSerializer < Serializer
      attribute :personal_informations do
        informations = object[:kisisel_bilgiler]
        next unless informations[:tc_kimlik_no]

        {
          id_number:         informations[:tc_kimlik_no].safe_to_i,
          first_name:        informations[:adi].titleize_tr,
          last_name:         informations[:soyadi].titleize_tr,
          father_name:       informations[:baba_adi].titleize_tr,
          mother_name:       informations[:anne_adi].titleize_tr,
          date_of_birth:     informations[:dogum_tarihi] && build_date(*informations[:dogum_tarihi].values_at(:yil, :ay, :gun)),
          nationality: {
            code:            informations.dig(:uyrugu, :kod).safe_to_i,
            name:            informations.dig(:uyrugu, :ad).titleize_tr
          },
          gender: {
            code:            informations.dig(:cinsiyeti, :kod).safe_to_i,
            name:            informations.dig(:cinsiyeti, :ad).titleize_tr
          }
        }
      end

      attribute :studentship_informations do
        informations = object[:ogrencilik_bilgileri]
        next unless informations[:kayit_tarihi]

        {
          student_number:    informations[:ogrenci_no].safe_to_i,
          entrance_point:    informations[:giris_puani].safe_to_i,
          current_term:      informations[:aktif_donem_no].safe_to_i,
          ects:              informations[:akts].safe_to_f,
          prep_term:         informations[:kac_donem_hazirlik].safe_to_i,
          registration_date: informations[:kayit_tarihi] && build_time(*informations[:kayit_tarihi].values_at(:yil, :ay, :gun, :saat, :dakika, :saniye)),
          prep_class: {
            code:            informations.dig(:hazirlik_sinifi, :kod).safe_to_i,
            name:            informations.dig(:hazirlik_sinifi, :ad).titleize_tr
          },
          entrance_point_type: {
            code:            informations.dig(:giris_puan_turu, :kod).safe_to_i,
            name:            informations.dig(:giris_puan_turu, :ad).capitalize_tr
          },
          entrance_type: {
            code:            informations.dig(:giris_turu, :kod).safe_to_i,
            name:            informations.dig(:giris_turu, :ad).upcase_tr
          },
          rights: {
            code:            informations.dig(:ogrencilik_hakki_varmi, :kod).safe_to_i,
            name:            informations.dig(:ogrencilik_hakki_varmi, :ad).titleize_tr
          },
          end_date_of_studentship_right: informations[:ogrencilik_hakki_bitti_tarih] && build_date(*informations[:ogrencilik_hakki_bitti_tarih].values_at(:yil, :ay, :gun)),
          status: {
            code:            informations.dig(:ogrencilik_statusu, :kod).safe_to_i,
            name:            informations.dig(:ogrencilik_statusu, :ad).titleize_tr
          },
          disability_type: {
            code:            informations.dig(:engel_turu, :kod).safe_to_i,
            name:            informations.dig(:engel_turu, :ad).titleize_tr
          },
          disability_rate:   informations[:engel_orani].safe_to_i,
          dropout_type: {
            code:            informations.dig(:ayrilma_nedeni, :kod).safe_to_i,
            name:            informations.dig(:ayrilma_nedeni, :ad).titleize_tr
          },
          dropout_date:      informations[:ayrilma_tarihi] && build_date(*informations[:ayrilma_tarihi].values_at(:yil, :ay, :gun)),
          martyrs_relative: {
            code:            informations.dig(:gazi_sehit_yakini, :kod).safe_to_i,
            name:            informations.dig(:gazi_sehit_yakini, :ad).titleize_tr
          },
          diploma: {
            gpa:             informations.dig(:diploma, :notu).safe_to_f,
            grading_system:  informations.dig(:diploma, :not_sistemi).safe_to_f,
            no:              informations.dig(:diploma, :no).safe_to_i
          }
        }
      end

      attribute :unit_informations do
        informations = object[:birim]
        next unless informations.dig(:birim, :kod)

        {
          long_name:         informations[:birim_uzun_adi].titleize_tr,
          english_name:      informations[:birim_adi_ingilizce].titleize,
          parent_unit_id:    informations[:bagli_oldugu_birim_id].safe_to_i,
          period_of_study:   informations[:ogrenim_suresi].safe_to_i,
          osym_id:           informations[:kilavuz_kodu].safe_to_i,
          university: {
            code:            informations.dig(:universite, :kod).safe_to_i,
            name:            informations.dig(:universite, :ad).titleize_tr
          },
          university_type: {
            code:            informations.dig(:universite_turu, :kod).safe_to_i,
            name:            informations.dig(:universite_turu, :ad).titleize_tr
          },
          unit: {
            code:            informations.dig(:birim, :kod).safe_to_i,
            name:            informations.dig(:birim, :ad).titleize_tr
          },
          unit_type: {
            code:            informations.dig(:birim_turu, :kod).safe_to_i,
            name:            informations.dig(:birim_turu, :ad).titleize_tr
          },
          faculty: {
            code:            informations.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
            name:            informations.dig(:fakulte_yo_myo_enstitu, :ad).titleize_tr
          },
          status: {
            code:            informations.dig(:aktiflik, :kod).safe_to_i,
            name:            informations.dig(:aktiflik, :ad).titleize_tr
          },
          instruction_language: {
            code:            informations.dig(:ogrenim_dili, :kod).safe_to_i,
            name:            informations.dig(:ogrenim_dili, :ad).titleize_tr
          },
          instruction_type: {
            code:            informations.dig(:ogrenim_turu, :kod).safe_to_i,
            name:            informations.dig(:ogrenim_turu, :ad).titleize_tr
          },
          city: {
            code:            informations.dig(:il, :kod).safe_to_i,
            name:            informations.dig(:il, :ad).titleize_tr
          },
          district: {
            code:            informations.dig(:ilce, :kod).safe_to_i,
            name:            informations.dig(:ilce, :ad).titleize_tr
          }
        }
      end

      attribute :undergrad_transfer_informations do
        informations = object[:ygecis_birim_id]
        next unless informations.dig(:universite, :kod)
        
        {
          long_name:         informations[:birim_uzun_adi].titleize_tr,
          english_name:      informations[:birim_adi_ingilizce].titleize,
          parent_unit_id:    informations[:bagli_oldugu_birim_id].safe_to_i,
          period_of_study:   informations[:ogrenim_suresi].safe_to_i,
          osym_id:           informations[:kilavuz_kodu].safe_to_i,
          university: {
            code:            informations.dig(:universite, :kod).safe_to_i,
            name:            informations.dig(:universite, :ad).titleize_tr
          },
          university_type: {
            code:            informations.dig(:universite_turu, :kod).safe_to_i,
            name:            informations.dig(:universite_turu, :ad).titleize_tr
          },
          unit: {
            code:            informations.dig(:birim, :kod).safe_to_i,
            name:            informations.dig(:birim, :ad).titleize_tr
          },
          unit_type: {
            code:            informations.dig(:birim_turu, :kod).safe_to_i,
            name:            informations.dig(:birim_turu, :ad).titleize_tr
          },
          faculty: {
            code:            informations.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
            name:            informations.dig(:fakulte_yo_myo_enstitu, :ad).titleize_tr
          },
          status: {
            code:            informations.dig(:aktiflik, :kod).safe_to_i,
            name:            informations.dig(:aktiflik, :ad).titleize_tr
          },
          instruction_language: {
            code:            informations.dig(:ogrenim_dili, :kod).safe_to_i,
            name:            informations.dig(:ogrenim_dili, :ad).titleize_tr
          },
          instruction_type: {
            code:            informations.dig(:ogrenim_turu, :kod).safe_to_i,
            name:            informations.dig(:ogrenim_turu, :ad).titleize_tr
          },
          city: {
            code:            informations.dig(:il, :kod).safe_to_i,
            name:            informations.dig(:il, :ad).titleize_tr
          },
          district: {
            code:            informations.dig(:ilce, :kod).safe_to_i,
            name:            informations.dig(:ilce, :ad).titleize_tr
          }
        }
      end
    end
  end
end
