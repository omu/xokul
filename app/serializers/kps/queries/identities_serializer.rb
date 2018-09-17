# frozen_string_literal: true

module Kps
  module Queries
    class IdentitiesSerializer < Serializer
      attribute(:id_number) { object[:kimlik_no].safe_to_i }

      attribute :blue_card_informations do
        tmp = object.dig(:mavi_kartli_kisi_kutukleri)
        next if tmp[:hata_bilgisi].present?
        next if tmp.dig(:kisi_bilgisi, :hata_bilgisi).present? && tmp.dig(:mavi_kart_bilgisi, :hata_bilgisi).present?
        {
          id_number:             tmp.dig(:kisi_bilgisi, :kimlik_no).safe_to_i,
          mother_id_number:       tmp.dig(:kisi_bilgisi, :anne_tc_kimlik_no).safe_to_i,
          father_id_number:       tmp.dig(:kisi_bilgisi, :baba_tc_kimlik_no).safe_to_i,
          old_id_number:         tmp.dig(:kisi_bilgisi, :es_tc_kimlik_no).safe_to_i,
          real_person_id_number: tmp.dig(:kisi_bilgisi, :gercek_kisi_kimlik_no).safe_to_i,
          earned_id_number:      tmp.dig(:kisi_bilgisi, :kazanilan_tc_kimlik_no).safe_to_i,
          code_of_place_of_birth: tmp.dig(:kisi_bilgisi, :dogum_yer_kod).safe_to_i,
          marital_status:         tmp.dig(:kisi_bilgisi, :durum_bilgisi, :medeni_hal),
          date_of_death: build_date(
            *tmp.dig(:kisi_bilgisi, :durum_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun)
          ),
          basic_informations: {
            first_name:     tmp.dig(:kisi_bilgisi, :temel_bilgisi, :ad),
            last_name:      tmp.dig(:kisi_bilgisi, :temel_bilgisi, :soyad),
            mother_name:    tmp.dig(:kisi_bilgisi, :temel_bilgisi, :anne_ad),
            father_name:    tmp.dig(:kisi_bilgisi, :temel_bilgisi, :baba_ad),
            gender:         tmp.dig(:kisi_bilgisi, :temel_bilgisi, :cinsiyet),
            place_of_birth: tmp.dig(:kisi_bilgisi, :temel_bilgisi, :dogum_yer),
            date_of_birth: build_date(
              *tmp.dig(:kisi_bilgisi, :temel_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun)
            )
          },
          card_informations:{
            id_number:          tmp.dig(:mavi_kart_bilgisi, :kimlik_no).safe_to_i,
            first_name:         tmp.dig(:mavi_kart_bilgisi, :ad),
            last_name:          tmp.dig(:mavi_kart_bilgisi, :soyad),
            previous_last_name: tmp.dig(:mavi_kart_bilgisi, :onceki_soyad),
            mother_name:        tmp.dig(:mavi_kart_bilgisi, :anne_ad),
            father_name:        tmp.dig(:mavi_kart_bilgisi, :baba_ad),
            gender:             tmp.dig(:mavi_kart_bilgisi, :cinsiyet),
            marital_status:     tmp.dig(:mavi_kart_bilgisi, :medeni_hal),
            nationality:        tmp.dig(:mavi_kart_bilgisi, :uyruk),
            date_of_birth: build_date(
              *tmp.dig(:mavi_kart_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun)
            ),
            place_of_birth:         tmp.dig(:mavi_kart_bilgisi, :dogum_yer),
            code_of_place_of_birth: tmp.dig(:mavi_kart_bilgisi, :dogum_yer_kod).safe_to_i,
            unit:                   tmp.dig(:mavi_kart_bilgisi, :birim),
            registration_no:        tmp.dig(:mavi_kart_bilgisi, :kart_kayit_no).safe_to_i,
            no:                     tmp.dig(:mavi_kart_bilgisi, :no).safe_to_i,
            seri:                   tmp.dig(:mavi_kart_bilgisi, :seri).safe_to_i,
            reason_of_issue:        tmp.dig(:mavi_kart_bilgisi, :verilis_neden),
            issue_date: build_date(
              *tmp.dig(:mavi_kart_bilgisi, :verilme_tarih).values_at(:yil, :ay, :gun)
            )
          }
        }
      end

      attribute :citizenship do
        tmp = object[:tc_vatandasi_kisi_kutukleri]
        next if tmp[:hata_bilgisi].present?

        temp_id_informations = tmp[:gecici_kimlik_bilgisi][:hata_bilgisi].present? || {
          id_number:           tmp.dig(:gecici_kimlik_bilgisi, :tc_kimlik_no).safe_to_i,
          first_name:          tmp.dig(:gecici_kimlik_bilgisi, :ad),
          last_name:           tmp.dig(:gecici_kimlik_bilgisi, :soyad),
          previous_last_name:  tmp.dig(:gecici_kimlik_bilgisi, :onceki_soyad),
          mother_name:         tmp.dig(:gecici_kimlik_bilgisi, :anne_ad),
          father_name:         tmp.dig(:gecici_kimlik_bilgisi, :baba_ad),
          gender:              tmp.dig(:gecici_kimlik_bilgisi, :cinsiyet),
          date_of_birth: build_date(
            *tmp.dig(:gecici_kimlik_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun)
          ),
          updated_at:          tmp.dig(:gecici_kimlik_bilgisi, :son_guncellenme_tarih),
          where_was_organized: tmp.dig(:gecici_kimlik_bilgisi, :duzenleyen_ilce),
          expiry_date:         tmp.dig(:gecici_kimlik_bilgisi, :son_gecerlilik_tarih)
        }

        personal_informations = tmp[:kisi_bilgisi][:hata_bilgisi].present? || {
          id_number:              tmp.dig(:kisi_bilgisi, :tc_kimlik_no).safe_to_i,
          mother_id_number:       tmp.dig(:kisi_bilgisi, :anne_tc_kimlik_no).safe_to_i,
          father_id_number:       tmp.dig(:kisi_bilgisi, :baba_tc_kimlik_no).safe_to_i,
          code_of_place_of_birth: tmp.dig(:kisi_bilgisi, :dogum_yer_kod).safe_to_i,
          religion:               tmp.dig(:kisi_bilgisi, :durum_bilgisi, :din),
          old_id_number:          tmp.dig(:kisi_bilgisi, :es_tc_kimlik_no).safe_to_i,
          marital_status: {
            code:        tmp.dig(:kisi_bilgisi, :durum_bilgisi, :medeni_hal, :kod).safe_to_i,
            description: tmp.dig(:kisi_bilgisi, :durum_bilgisi, :medeni_hal, :aciklama)
          },
          date_of_death: build_date(
            *tmp.dig(:kisi_bilgisi, :durum_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun)
          ),
          place_of_registration: {
            family_number: tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :aile_sira_no).safe_to_i,
            person_number: tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :birey_sira_no).safe_to_i,
            binder: {
              code:        tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :cilt, :kod).safe_to_i,
              description: tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :cilt, :aciklama)
            },
            city: {
              code:        tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :il, :kod).safe_to_i,
              description: tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :il, :aciklama)
            },
            district: {
              code:        tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :ilce, :kod).safe_to_i,
              description: tmp.dig(:kisi_bilgisi, :kayit_yeri_bilgisi, :ilce, :aciklama)
            }
          },
          basic_informations: {
            first_name:     tmp.dig(:kisi_bilgisi, :temel_bilgisi, :ad),
            last_name:      tmp.dig(:kisi_bilgisi, :temel_bilgisi, :soyad),
            mother_name:    tmp.dig(:kisi_bilgisi, :temel_bilgisi, :anne_ad),
            father_name:    tmp.dig(:kisi_bilgisi, :temel_bilgisi, :baba_ad),
            place_of_birth: tmp.dig(:kisi_bilgisi, :temel_bilgisi, :dogum_yer),
            gender: {
              code: tmp.dig(:kisi_bilgisi, :temel_bilgisi, :cinsiyet, :kod).safe_to_i,
              description: tmp.dig(:kisi_bilgisi, :temel_bilgisi, :cinsiyet, :aciklama)
            },
            date_of_birth: build_date(
              *tmp.dig(:kisi_bilgisi, :temel_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun)
            )
          }
        }

        id_card_informations = tmp[:nufus_cuzdani_bilgisi][:hata_bilgisi].present? || {
          id_number:      tmp.dig(:nufus_cuzdani_bilgisi, :tc_kimlik_no).safe_to_i,
          first_name:     tmp.dig(:nufus_cuzdani_bilgisi, :ad),
          last_name:      tmp.dig(:nufus_cuzdani_bilgisi, :soyad),
          mother_name:    tmp.dig(:nufus_cuzdani_bilgisi, :anne_ad),
          father_name:    tmp.dig(:nufus_cuzdani_bilgisi, :baba_ad),
          place_of_birth: tmp.dig(:nufus_cuzdani_bilgisi, :dogum_yer),
          date_of_birth: build_date(
            *tmp.dig(:nufus_cuzdani_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun)
          ),
          no:   tmp.dig(:nufus_cuzdani_bilgisi, :no).safe_to_i,
          seri: tmp.dig(:nufus_cuzdani_bilgisi, :seri).safe_to_i,
          reason_of_issue: {
            code:        tmp.dig(:nufus_cuzdani_bilgisi, :cuzdan_verilme_neden, :kod).safe_to_i,
            description: tmp.dig(:nufus_cuzdani_bilgisi, :cuzdan_verilme_neden, :aciklama)
          },
          registration_no: tmp.dig(:nufus_cuzdani_bilgisi, :cuzdan_kayit_no).safe_to_i,
          district_for_issue: {
            code:        tmp.dig(:nufus_cuzdani_bilgisi, :verildigi_ilce, :kod).safe_to_i,
            description: tmp.dig(:nufus_cuzdani_bilgisi, :verildigi_ilce, :aciklama)
          },
          date_of_issue: build_date(
            *tmp.dig(:nufus_cuzdani_bilgisi, :verilme_tarih).values_at(:yil, :ay, :gun)
          )
        }

        tckk_informations = tmp[:tckk_bilgisi][:hata_bilgisi].present? || {
          id_number:      tmp.dig(:tckk_bilgisi, :tc_kimlik_no).safe_to_i,
          first_name:     tmp.dig(:tckk_bilgisi, :ad),
          last_name:      tmp.dig(:tckk_bilgisi, :anne_ad),
          mother_name:    tmp.dig(:tckk_bilgisi, :baba_ad),
          gender:         tmp.dig(:tckk_bilgisi, :cinsiyet),
          place_of_birth: tmp.dig(:tckk_bilgisi, :dogum_yer),
          date_of_birth: build_date(
            *tmp.dig(:tckk_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun)
          ),
          seri_no:              tmp.dig(:tckk_bilgisi, :seri_no).safe_to_i,
          registration_no:      tmp.dig(:tckk_bilgisi, :kayit_no).safe_to_i,
          expiry_date:          tmp.dig(:tckk_bilgisi, :son_gecerlilik_tarih),
          delivery_date:        tmp.dig(:tckk_bilgisi, :teslim_tarih),
          deliverer_unit:       tmp.dig(:tckk_bilgisi, :teslim_eden_birim),
          issuing_authority:    tmp.dig(:tckk_bilgisi, :veren_makam),
          date_of_admission:    tmp.dig(:tckk_bilgisi, :verilme_tarih),
          reason_of_admission:  tmp.dig(:tckk_bilgisi, :verilme_nedeni),
          photograph: {
            id_number:   tmp.dig(:tckk_bilgisi, :tckk_fotograf_bilgisi, :tc_kimlik_no).safe_to_i,
            description: tmp.dig(:tckk_bilgisi, :tckk_fotograf_bilgisi, :fotograf)
          }
        }

        {
          temporary_identity_informations: temp_id_informations,
          personal_informations: personal_informations,
          identity_card_informations: id_card_informations,
          tckk_informations: tckk_informations
        }
      end

      attribute :foreigner do
        tmp = object[:yabanci_kisi_kutukleri]
        next if tmp.dig(:kisi_bilgisi, :hata_bilgisi).present?

        {
          id_number:              tmp.dig(:kisi_bilgisi, :kimlik_no).safe_to_i,
          mother_id_number:       tmp.dig(:kisi_bilgisi, :anne_kimlik_no).safe_to_i,
          father_id_number:       tmp.dig(:kisi_bilgisi, :baba_kimlik_no).safe_to_i,
          code_of_place_of_birth: tmp.dig(:kisi_bilgisi, :dogum_yer_kod).safe_to_i,
          date_of_birth:          tmp.dig(:kisi_bilgisi, :dogum_tarih),
          date_of_death: build_date(
            *tmp.dig(:kisi_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun)
          ),
          marital_status:                tmp.dig(:kisi_bilgisi, :durum_bilgisi, :medeni_hal),
          old_id_number:                 tmp.dig(:kisi_bilgisi, :es_kimlik_no).safe_to_i,
          nationality:                   tmp.dig(:kisi_bilgisi, :uyruk),
          start_date_of_entry_clearance: tmp.dig(:kisi_bilgisi, :izin_baslangic_tarih),
          end_date_of_entry_clearance:   tmp.dig(:kisi_bilgisi, :izin_bitis_tarih),
          clearence_no:                  tmp.dig(:kisi_bilgisi, :izin_no).safe_to_i,
          where_was_organized:           tmp.dig(:kisi_bilgisi, :izin_duzenlenen_il),
          source_unit:                   tmp.dig(:kisi_bilgisi, :kaynak_birim),
          earned_id_number:              tmp.dig(:kisi_bilgisi, :kazanilan_tc_kimlik_no).safe_to_i,
          real_person_id_number:         tmp.dig(:kisi_bilgisi, :gercek_kisi_kimlik_no).safe_to_i,
          basic_informations: {
            first_name:     tmp.dig(:kisi_bilgisi, :temel_bilgisi, :ad),
            last_name:      tmp.dig(:kisi_bilgisi, :temel_bilgisi, :soyad),
            mother_name:    tmp.dig(:kisi_bilgisi, :temel_bilgisi, :anne_ad),
            father_name:    tmp.dig(:kisi_bilgisi, :temel_bilgisi, :baba_ad),
            gender:         tmp.dig(:kisi_bilgisi, :temel_bilgisi, :cinsiyet),
            place_of_birth: tmp.dig(:kisi_bilgisi, :temel_bilgisi, :dogum_yer)
          }
        }
      end
    end
  end
end