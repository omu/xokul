# frozen_string_literal: true

module Yoksis
  module Students
    class InformationsSerializer < Serializer
      attribute :personal_informations do
        tmp = object[:kisisel_bilgiler]
        {
          id_number:     tmp[:tc_kimlik_no].safe_to_i,
          first_name:    tmp[:adi],
          last_name:     tmp[:soyadi],
          father_name:   tmp[:baba_adi],
          mother_name:   tmp[:anne_adi],
          date_of_birth: tmp[:dogum_tarihi] && build_date(
            *tmp[:dogum_tarihi].values_at(:yil, :ay, :gun)
          ),
          nationality: {
            code: tmp.dig(:uyrugu, :kod).safe_to_i,
            name: tmp.dig(:uyrugu, :ad)
          },
          gender: {
            code: tmp.dig(:cinsiyeti, :kod).safe_to_i,
            name: tmp.dig(:cinsiyeti, :ad)
          }
        }
      end

      attribute :studenthip_informations do
        tmp = object[:ogrencilik_bilgileri]
        {
          student_number:    tmp[:ogrenci_no].safe_to_i,
          entrance_point:    tmp[:giris_puani].safe_to_i,
          current_term:      tmp[:aktif_donem_no].safe_to_i,
          akts:              tmp[:akts].safe_to_f,
          prep_term:         tmp[:kac_donem_hazirlik].safe_to_i,
          registration_date: tmp[:kayit_tarihi] && build_time(
            *tmp[:kayit_tarihi].values_at(:yil, :ay, :gun, :saat, :dakika, :saniye)
          ),
          prep_class: {
            code: tmp.dig(:hazirlik_sinifi, :kod).safe_to_i,
            name: tmp.dig(:hazirlik_sinifi, :ad)
          },
          entrance_point_type: {
            code: tmp.dig(:giris_puan_turu, :kod).safe_to_i,
            name: tmp.dig(:giris_puan_turu, :ad)
          },
          entrance_type: {
            code: tmp.dig(:giris_turu, :kod).safe_to_i,
            name: tmp.dig(:giris_turu, :ad)
          },
          rights: {
            code: tmp.dig(:ogrencilik_hakki_varmi, :kod).safe_to_i,
            name: tmp.dig(:ogrencilik_hakki_varmi, :ad)
          },
          end_date_of_studentship_right: tmp[:ogrencilik_hakki_bitti_tarih] && build_date(
            *tmp[:ogrencilik_hakki_bitti_tarih].values_at(:yil, :ay, :gun)
          ),
          status: {
            code: tmp.dig(:ogrencilik_statusu, :kod).safe_to_i,
            name: tmp.dig(:ogrencilik_statusu, :ad)
          },
          disability_type: {
            code: tmp.dig(:engel_turu, :kod).safe_to_i,
            name: tmp.dig(:engel_turu, :ad)
          },
          disability_rate: tmp[:engel_orani].safe_to_i,
          dropout_type: {
            code: tmp.dig(:ayrilma_nedeni, :kod).safe_to_i,
            name: tmp.dig(:ayrilma_nedeni, :ad)
          },
          dropout_date: tmp[:ayrilma_tarihi] && build_date(
            *tmp[:ayrilma_tarihi].values_at(:yil, :ay, :gun)
          ),
          martyrs_relative: {
            code: tmp.dig(:gazi_sehit_yakini, :kod).safe_to_i,
            name: tmp.dig(:gazi_sehit_yakini, :ad)
          },
          diploma: {
            gpa: tmp.dig(:diploma, :notu).safe_to_f,
            grading_system: tmp.dig(:diploma, :not_sistemi).safe_to_f,
            no: tmp.dig(:diploma, :no).safe_to_i
          }
        }
      end

      attribute :unit_informations do
        tmp = object[:birim]
        {
          long_name:       tmp[:birim_uzun_adi],
          english_name:    tmp[:birim_adi_ingilizce],
          parent_unit_id:  tmp[:bagli_oldugu_birim_id].safe_to_i,
          period_of_study: tmp[:ogrenim_suresi].safe_to_i,
          guide_code:      tmp[:kilavuz_kodu].safe_to_i,
          university: {
            code: tmp.dig(:universite, :kod).safe_to_i,
            name: tmp.dig(:universite, :ad)
          },
          university_type: {
            code: tmp.dig(:universite_turu, :kod).safe_to_i,
            name: tmp.dig(:universite_turu, :ad)
          },
          unit: {
            code: tmp.dig(:birim, :kod).safe_to_i,
            name: tmp.dig(:birim, :ad)
          },
          unit_type: {
            code: tmp.dig(:birim_turu, :kod).safe_to_i,
            name: tmp.dig(:birim_turu, :ad)
          },
          faculty: {
            code: tmp.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
            name: tmp.dig(:fakulte_yo_myo_enstitu, :ad)
          },
          status: {
            code: tmp.dig(:aktiflik, :kod).safe_to_i,
            name: tmp.dig(:aktiflik, :ad)
          },
          instruction_language: {
            code: tmp.dig(:ogrenim_dili, :kod).safe_to_i,
            name: tmp.dig(:ogrenim_dili, :ad)
          },
          instruction_type: {
            code: tmp.dig(:ogrenim_turu, :kod).safe_to_i,
            name: tmp.dig(:ogrenim_turu, :ad)
          },
          city: {
            code: tmp.dig(:il, :kod).safe_to_i,
            name: tmp.dig(:il, :ad)
          },
          district: {
            code: tmp.dig(:ilce, :kod).safe_to_i,
            name: tmp.dig(:ilce, :ad)
          }
        }
      end

      attribute :undergrad_transfer_informations do
        tmp = object[:ygecis_birim_id]
        {
          long_name:       tmp[:birim_uzun_adi],
          english_name:    tmp[:birim_adi_ingilizce],
          parent_unit_id:  tmp[:bagli_oldugu_birim_id].safe_to_i,
          period_of_study: tmp[:ogrenim_suresi].safe_to_i,
          guide_code:      tmp[:kilavuz_kodu].safe_to_i,
          university: {
            code: tmp.dig(:universite, :kod).safe_to_i,
            name: tmp.dig(:universite, :ad)
          },
          university_type: {
            code: tmp.dig(:universite_turu, :kod).safe_to_i,
            name: tmp.dig(:universite_turu, :ad)
          },
          unit: {
            code: tmp.dig(:birim, :kod).safe_to_i,
            name: tmp.dig(:birim, :ad)
          },
          unit_type: {
            code: tmp.dig(:birim_turu, :kod).safe_to_i,
            name: tmp.dig(:birim_turu, :ad)
          },
          faculty: {
            code: tmp.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
            name: tmp.dig(:fakulte_yo_myo_enstitu, :ad)
          },
          status: {
            code: tmp.dig(:aktiflik, :kod).safe_to_i,
            name: tmp.dig(:aktiflik, :ad)
          },
          instruction_language: {
            code: tmp.dig(:ogrenim_dili, :kod).safe_to_i,
            name: tmp.dig(:ogrenim_dili, :ad)
          },
          instruction_type: {
            code: tmp.dig(:ogrenim_turu, :kod).safe_to_i,
            name: tmp.dig(:ogrenim_turu, :ad)
          },
          city: {
            code: tmp.dig(:il, :kod).safe_to_i,
            name: tmp.dig(:il, :ad)
          },
          district: {
            code: tmp.dig(:ilce, :kod).safe_to_i,
            name: tmp.dig(:ilce, :ad)
          }
        }
      end
    end
  end
end
