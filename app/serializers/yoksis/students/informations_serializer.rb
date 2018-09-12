# frozen_string_literal: true

module Yoksis
  module Students
    class InformationsSerializer < Serializer
      attribute(:personal_informations) do
        tmp = object[:kisisel_bilgiler]
        {
          id_number:     tmp[:tc_kimlik_no].try(:to_i),
          first_name:    tmp[:adi],
          last_name:     tmp[:soyadi],
          father_name:   tmp[:baba_adi],
          mother_name:   tmp[:anne_adi],
          date_of_birth: build_date(*tmp[:dogum_tarihi].values_at(:yil, :ay, :gun)),
          nationality: {
            code: tmp.dig(:uyrugu, :kod).try(:to_i),
            name: tmp.dig(:uyrugu, :ad)
          },
          gender: {
            code: tmp.dig(:cinsiyeti, :kod).try(:to_i),
            name: tmp.dig(:cinsiyeti, :ad)
          }
        }
      end
      attribute(:studenthip_informations) do
        tmp = object[:ogrencilik_bilgileri]
        {
          student_number:    tmp.dig(:ogrenci_no).try(:to_i),
          entrance_point:    tmp.dig(:giris_puani).try(:to_i),
          registration_date: build_time(*tmp.dig(:kayit_tarihi).values_at(:yil, :ay, :gun, :saat, :dakika, :saniye)),
          current_term:      tmp.dig(:aktif_donem_no).try(:to_i),
          akts:              tmp.dig(:akts).try(:to_f),
          prep_term:         tmp.dig(:kac_donem_hazirlik).try(:to_i),
          prep_class: {
            code: tmp.dig(:hazirlik_sinifi, :kod).try(:to_i),
            name: tmp.dig(:hazirlik_sinifi, :ad)
          },
          entrance_point_type: {
            code: tmp.dig(:giris_puan_turu, :kod).try(:to_i),
            name: tmp.dig(:giris_puan_turu, :ad)
          },
          entrance_type: {
            code: tmp.dig(:giris_turu, :kod).try(:to_i),
            name: tmp.dig(:giris_turu, :ad)
          },
          rights: {
            code: tmp.dig(:ogrencilik_hakki_varmi, :kod).try(:to_i),
            name: tmp.dig(:ogrencilik_hakki_varmi, :ad)
          },
          end_date_of_studentship_right: build_date(*tmp.dig(:ogrencilik_hakki_bitti_tarih).values_at(:yil, :ay, :gun)),
          status: {
            code: tmp.dig(:ogrencilik_statusu, :kod).try(:to_i),
            name: tmp.dig(:ogrencilik_statusu, :ad)
          },
          disability_type: {
            code: tmp.dig(:engel_turu, :kod).try(:to_i),
            name: tmp.dig(:engel_turu, :ad)
          },
          disability_rate: tmp.dig(:engel_orani).try(:to_i),
          dropout_type: {
            code: tmp.dig(:ayrilma_nedeni, :kod).try(:to_i),
            name: tmp.dig(:ayrilma_nedeni, :ad)
          },
          dropout_date: build_date(*tmp.dig(:ayrilma_tarihi).values_at(:yil, :ay, :gun)),
          martyrs_relative: {
            code: tmp.dig(:gazi_sehit_yakini, :kod).try(:to_i),
            name: tmp.dig(:gazi_sehit_yakini, :ad)
          },
          diploma: {
            gpa: tmp.dig(:diploma, :notu).try(:to_f),
            grading_system: tmp.dig(:diploma, :not_sistemi).try(:to_f),
            no: tmp.dig(:diploma, :no).try(:to_i)
          }
        }
      end
      attribute(:unit_informations) do
        tmp = object[:birim]
        {
          long_name:       tmp.dig(:birim_uzun_adi),
          english_name:    tmp.dig(:birim_adi_ingilizce),
          parent_unit_id:  tmp.dig(:bagli_oldugu_birim_id).try(:to_i),
          period_of_study: tmp.dig(:ogrenim_suresi).try(:to_i),
          guide_code:      tmp.dig(:kilavuz_kodu).try(:to_i),
          university: {
            code: tmp.dig(:universite, :kod).try(:to_i),
            name: tmp.dig(:universite, :ad)
          },
          university_type: {
            code: tmp.dig(:universite_turu, :kod).try(:to_i),
            name: tmp.dig(:universite_turu, :ad)
          },
          unit: {
            code: tmp.dig(:birim, :kod).try(:to_i),
            name: tmp.dig(:birim, :ad)
          },
          unit_type: {
            code: tmp.dig(:birim_turu, :kod).try(:to_i),
            name: tmp.dig(:birim_turu, :ad)
          },
          faculty: {
            code: tmp.dig(:fakulte_yo_myo_enstitu, :kod).try(:to_i),
            name: tmp.dig(:fakulte_yo_myo_enstitu, :ad)
          },
          status: {
            code: tmp.dig(:aktiflik, :kod).try(:to_i),
            name: tmp.dig(:aktiflik, :ad)
          },
          instruction_language: {
            code: tmp.dig(:ogrenim_dili, :kod).try(:to_i),
            name: tmp.dig(:ogrenim_dili, :ad)
          },
          instruction_type: {
            code: tmp.dig(:ogrenim_turu, :kod).try(:to_i),
            name: tmp.dig(:ogrenim_turu, :ad)
          },
          city: {
            code: tmp.dig(:il, :kod).try(:to_i),
            name: tmp.dig(:il, :ad)
          },
          district: {
            code: tmp.dig(:ilce, :kod).try(:to_i),
            name: tmp.dig(:ilce, :ad)
          }
        }
      end
      attribute(:undergrad_transfer_informations) do
        tmp = object[:ygecis_birim_id]
        {
          long_name:       tmp.dig(:birim_uzun_adi),
          english_name:    tmp.dig(:birim_adi_ingilizce),
          parent_unit_id:  tmp.dig(:bagli_oldugu_birim_id).try(:to_i),
          period_of_study: tmp.dig(:ogrenim_suresi).try(:to_i),
          guide_code:      tmp.dig(:kilavuz_kodu).try(:to_i),
          university: {
            code: tmp.dig(:universite, :kod).try(:to_i),
            name: tmp.dig(:universite, :ad)
          },
          university_type: {
            code: tmp.dig(:universite_turu, :kod).try(:to_i),
            name: tmp.dig(:universite_turu, :ad)
          },
          unit: {
            code: tmp.dig(:birim, :kod).try(:to_i),
            name: tmp.dig(:birim, :ad)
          },
          unit_type: {
            code: tmp.dig(:birim_turu, :kod).try(:to_i),
            name: tmp.dig(:birim_turu, :ad)
          },
          faculty: {
            code: tmp.dig(:fakulte_yo_myo_enstitu, :kod).try(:to_i),
            name: tmp.dig(:fakulte_yo_myo_enstitu, :ad)
          },
          status: {
            code: tmp.dig(:aktiflik, :kod).try(:to_i),
            name: tmp.dig(:aktiflik, :ad)
          },
          instruction_language: {
            code: tmp.dig(:ogrenim_dili, :kod).try(:to_i),
            name: tmp.dig(:ogrenim_dili, :ad)
          },
          instruction_type: {
            code: tmp.dig(:ogrenim_turu, :kod).try(:to_i),
            name: tmp.dig(:ogrenim_turu, :ad)
          },
          city: {
            code: tmp.dig(:il, :kod).try(:to_i),
            name: tmp.dig(:il, :ad)
          },
          district: {
            code: tmp.dig(:ilce, :kod).try(:to_i),
            name: tmp.dig(:ilce, :ad)
          }
        }
      end
    end
  end
end
