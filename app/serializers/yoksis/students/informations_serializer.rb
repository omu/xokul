# frozen_string_literal: true

module Yoksis
  module Students
    class InformationsSerializer < Serializer
      attribute :personal_informations do
        t = object[:kisisel_bilgiler]
        next unless t[:tc_kimlik_no]
        {
          id_number:     t[:tc_kimlik_no].safe_to_i,
          first_name:    t[:adi],
          last_name:     t[:soyadi],
          father_name:   t[:baba_adi],
          mother_name:   t[:anne_adi],
          date_of_birth: t[:dogum_tarihi] && build_date(
            *t[:dogum_tarihi].values_at(:yil, :ay, :gun)
          ),
          nationality: {
            code: t.dig(:uyrugu, :kod).safe_to_i,
            name: t.dig(:uyrugu, :ad).capitalize
          },
          gender: {
            code: t.dig(:cinsiyeti, :kod).safe_to_i,
            name: t.dig(:cinsiyeti, :ad)
          }
        }
      end

      attribute :studentship_informations do
        t = object[:ogrencilik_bilgileri]
        next unless t[:kayit_tarihi]
        {
          student_number:    t[:ogrenci_no].safe_to_i,
          entrance_point:    t[:giris_puani].safe_to_i,
          current_term:      t[:aktif_donem_no].safe_to_i,
          ects:              t[:akts].safe_to_f,
          prep_term:         t[:kac_donem_hazirlik].safe_to_i,
          registration_date: t[:kayit_tarihi] && build_time(
            *t[:kayit_tarihi].values_at(:yil, :ay, :gun, :saat, :dakika, :saniye)
          ),
          prep_class: {
            code: t.dig(:hazirlik_sinifi, :kod).safe_to_i,
            name: t.dig(:hazirlik_sinifi, :ad)
          },
          entrance_point_type: {
            code: t.dig(:giris_puan_turu, :kod).safe_to_i,
            name: t.dig(:giris_puan_turu, :ad)
          },
          entrance_type: {
            code: t.dig(:giris_turu, :kod).safe_to_i,
            name: t.dig(:giris_turu, :ad)
          },
          rights: {
            code: t.dig(:ogrencilik_hakki_varmi, :kod).safe_to_i,
            name: t.dig(:ogrencilik_hakki_varmi, :ad)
          },
          end_date_of_studentship_right: t[:ogrencilik_hakki_bitti_tarih] && build_date(
            *t[:ogrencilik_hakki_bitti_tarih].values_at(:yil, :ay, :gun)
          ),
          status: {
            code: t.dig(:ogrencilik_statusu, :kod).safe_to_i,
            name: t.dig(:ogrencilik_statusu, :ad)
          },
          disability_type: {
            code: t.dig(:engel_turu, :kod).safe_to_i,
            name: t.dig(:engel_turu, :ad)
          },
          disability_rate: t[:engel_orani].safe_to_i,
          dropout_type: {
            code: t.dig(:ayrilma_nedeni, :kod).safe_to_i,
            name: t.dig(:ayrilma_nedeni, :ad)
          },
          dropout_date: t[:ayrilma_tarihi] && build_date(
            *t[:ayrilma_tarihi].values_at(:yil, :ay, :gun)
          ),
          martyrs_relative: {
            code: t.dig(:gazi_sehit_yakini, :kod).safe_to_i,
            name: t.dig(:gazi_sehit_yakini, :ad)
          },
          diploma: {
            gpa: t.dig(:diploma, :notu).safe_to_f,
            grading_system: t.dig(:diploma, :not_sistemi).safe_to_f,
            no: t.dig(:diploma, :no).safe_to_i
          }
        }
      end

      attribute :unit_informations do
        t = object[:birim]
        next unless t.dig(:birim, :kod)
        {
          long_name:       t[:birim_uzun_adi],
          english_name:    t[:birim_adi_ingilizce],
          parent_unit_id:  t[:bagli_oldugu_birim_id].safe_to_i,
          period_of_study: t[:ogrenim_suresi].safe_to_i,
          osym_id:         t[:kilavuz_kodu].safe_to_i,
          university: {
            code: t.dig(:universite, :kod).safe_to_i,
            name: t.dig(:universite, :ad)
          },
          university_type: {
            code: t.dig(:universite_turu, :kod).safe_to_i,
            name: t.dig(:universite_turu, :ad)
          },
          unit: {
            code: t.dig(:birim, :kod).safe_to_i,
            name: t.dig(:birim, :ad)
          },
          unit_type: {
            code: t.dig(:birim_turu, :kod).safe_to_i,
            name: t.dig(:birim_turu, :ad)
          },
          faculty: {
            code: t.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
            name: t.dig(:fakulte_yo_myo_enstitu, :ad)
          },
          status: {
            code: t.dig(:aktiflik, :kod).safe_to_i,
            name: t.dig(:aktiflik, :ad)
          },
          instruction_language: {
            code: t.dig(:ogrenim_dili, :kod).safe_to_i,
            name: t.dig(:ogrenim_dili, :ad)
          },
          instruction_type: {
            code: t.dig(:ogrenim_turu, :kod).safe_to_i,
            name: t.dig(:ogrenim_turu, :ad)
          },
          city: {
            code: t.dig(:il, :kod).safe_to_i,
            name: t.dig(:il, :ad)
          },
          district: {
            code: t.dig(:ilce, :kod).safe_to_i,
            name: t.dig(:ilce, :ad)
          }
        }
      end

      attribute :undergrad_transfer_informations do
        t = object[:ygecis_birim_id]
        next unless t.dig(:universite, :kod)
        {
          long_name:       t[:birim_uzun_adi],
          english_name:    t[:birim_adi_ingilizce],
          parent_unit_id:  t[:bagli_oldugu_birim_id].safe_to_i,
          period_of_study: t[:ogrenim_suresi].safe_to_i,
          osym_id:         t[:kilavuz_kodu].safe_to_i,
          university: {
            code: t.dig(:universite, :kod).safe_to_i,
            name: t.dig(:universite, :ad)
          },
          university_type: {
            code: t.dig(:universite_turu, :kod).safe_to_i,
            name: t.dig(:universite_turu, :ad)
          },
          unit: {
            code: t.dig(:birim, :kod).safe_to_i,
            name: t.dig(:birim, :ad)
          },
          unit_type: {
            code: t.dig(:birim_turu, :kod).safe_to_i,
            name: t.dig(:birim_turu, :ad)
          },
          faculty: {
            code: t.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
            name: t.dig(:fakulte_yo_myo_enstitu, :ad)
          },
          status: {
            code: t.dig(:aktiflik, :kod).safe_to_i,
            name: t.dig(:aktiflik, :ad)
          },
          instruction_language: {
            code: t.dig(:ogrenim_dili, :kod).safe_to_i,
            name: t.dig(:ogrenim_dili, :ad)
          },
          instruction_type: {
            code: t.dig(:ogrenim_turu, :kod).safe_to_i,
            name: t.dig(:ogrenim_turu, :ad)
          },
          city: {
            code: t.dig(:il, :kod).safe_to_i,
            name: t.dig(:il, :ad)
          },
          district: {
            code: t.dig(:ilce, :kod).safe_to_i,
            name: t.dig(:ilce, :ad)
          }
        }
      end
    end
  end
end
