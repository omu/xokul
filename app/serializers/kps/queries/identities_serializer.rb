# frozen_string_literal: true

module Kps
  module Queries
    class IdentitiesSerializer < Serializer
      attribute(:id_number) { object[:kimlik_no].safe_to_i }

      attribute :blue_card_informations do
        informations = object.dig(:mavi_kartli_kisi_kutukleri)
        next if informations[:hata_bilgisi]

        personal_informations = informations[:kisi_bilgisi]

        basic_informations = {
          first_name:               personal_informations.dig(:temel_bilgisi, :ad).titleize_tr,
          last_name:                personal_informations.dig(:temel_bilgisi, :soyad).titleize_tr,
          fathers_name:             personal_informations.dig(:temel_bilgisi, :baba_ad).titleize_tr,
          mothers_name:             personal_informations.dig(:temel_bilgisi, :anne_ad).titleize_tr,
          gender: {
            code:                   personal_informations.dig(:temel_bilgisi, :cinsiyet, :kod).safe_to_i,
            description:            personal_informations.dig(:temel_bilgisi, :cinsiyet, :aciklama).titleize_tr
          },
          place_of_birth:           personal_informations.dig(:temel_bilgisi, :dogum_yer).titleize_tr,
          date_of_birth:            build_date(*personal_informations.dig(:temel_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun))
        }

        status_informations = {
          status: {
            code:                   personal_informations.dig(:durum_bilgisi, :durum, :kod).safe_to_i,
            description:            personal_informations.dig(:durum_bilgisi, :durum, :aciklama).titleize_tr
          },
          marital_status: {
            code:                   personal_informations.dig(:durum_bilgisi, :medeni_hal, :kod).safe_to_i,
            description:            personal_informations.dig(:durum_bilgisi, :medeni_hal, :aciklama).titleize_tr
          },
          date_of_death:            build_date(*personal_informations.dig(:durum_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun))

        }

        personal_informations = personal_informations[:hata_bilgisi].present? ? nil : {
          id_number:                personal_informations[:kimlik_no].safe_to_i,
          old_id_number:            personal_informations[:es_tc_kimlik_no].safe_to_i,
          new_id_number:            personal_informations[:kazanilan_tc_kimlik_no].safe_to_i,
          fathers_id_number:        personal_informations[:baba_tc_kimlik_no].safe_to_i,
          mothers_id_number:        personal_informations[:anne_tc_kimlik_no].safe_to_i,
          real_person_id_number:    personal_informations[:gercek_kisi_kimlik_no].safe_to_i,
          country:                  personal_informations[:ulke].titleize_tr,
          status_informations:      status_informations,
          basic_informations:       basic_informations
        }

        card_informations = informations[:mavi_kart_bilgisi]
        card_informations = card_informations[:hata_bilgisi].present? ? nil : {
          id_number:                card_informations[:kimlik_no].safe_to_i,
          first_name:               card_informations[:ad].titleize_tr,
          last_name:                card_informations[:soyad].titleize_tr,
          fathers_name:             card_informations[:baba_ad].titleize_tr,
          mothers_name:             card_informations[:anne_ad].titleize_tr,
          gender: {
            code:                   card_informations.dig(:cinsiyet, :kod).safe_to_i,
            description:            card_informations.dig(:cinsiyet, :aciklama).titleize_tr
          },
          nationality:              card_informations[:uyruk].titleize_tr,
          marital_status: {
            code:                   card_informations.dig(:medeni_hal, :kod).safe_to_i,
            description:            card_informations.dig(:medeni_hal, :aciklama).titleize_tr
          },
          place_of_birth:           card_informations[:dogum_yer].titleize_tr,
          code_of_place_of_birth:   card_informations[:dogum_yer_kod].safe_to_i,
          date_of_birth:            build_date(*card_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          previous_last_name:       card_informations[:onceki_soyad].titleize_tr,
          unit:                     card_informations[:birim].titleize_tr,
          number:                   card_informations[:no].safe_to_i,
          registration_number:      card_informations[:kayit_no].safe_to_i,
          serial_number:            card_informations[:seri],
          issuing_reason:           card_informations[:verilis_neden].titleize_tr,
          issuing_date:             build_date(*card_informations[:verilme_tarih].values_at(:yil, :ay, :gun))
        }

        next unless [personal_informations, card_informations].any?

        {
          personal_informations:    personal_informations,
          card_informations:        card_informations
        }
      end

      attribute :citizenship_informations do
        informations = object[:tc_vatandasi_kisi_kutukleri]
        next if informations[:hata_bilgisi]

        temporary_identity_informations = informations[:gecici_kimlik_bilgisi]
        temporary_identity_informations = temporary_identity_informations[:hata_bilgisi].present? ? nil : {
          id_number:                temporary_identity_informations[:tc_kimlik_no].safe_to_i,
          first_name:               temporary_identity_informations[:ad].titleize_tr,
          last_name:                temporary_identity_informations[:soyad].titleize_tr,
          fathers_name:             temporary_identity_informations[:baba_ad].titleize_tr,
          mothers_name:             temporary_identity_informations[:anne_ad].titleize_tr,
          gender: {
            code:                   temporary_identity_informations.dig(:cinsiyet, :kod).safe_to_i,
            description:            temporary_identity_informations.dig(:cinsiyet, :aciklama).titleize_tr
          },
          date_of_birth:            temporary_identity_informations[:dogum_tarih]          && build_date(*temporary_identity_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          previous_last_name:       temporary_identity_informations[:onceki_soyad].titleize_tr,
          document_number:          temporary_identity_informations[:belge_no].safe_to_i,
          issuing_district:         temporary_identity_informations[:duzenleyen_ilce].titleize_tr,
          issuing_date:             temporary_identity_informations[:duzenlenme_tarih]     && build_date(*temporary_identity_informations[:duzenlenme_tarih].values_at(:yil, :ay, :gun)),
          date_of_expiration:       temporary_identity_informations[:son_gecerlilik_tarih] && build_date(*temporary_identity_informations[:son_gecerlilik_tarih].values_at(:yil, :ay, :gun))
        }

        personal_informations = informations[:kisi_bilgisi]

        status_informations = {
          religion:                 personal_informations.dig(:durum_bilgisi, :din).titleize_tr,
          status: {
            code:                   personal_informations.dig(:durum_bilgisi, :durum, :kod).safe_to_i,
            description:            personal_informations.dig(:durum_bilgisi, :durum, :aciklama).titleize_tr
          },
          marital_status: {
            code:                   personal_informations.dig(:durum_bilgisi, :medeni_hal, :kod).safe_to_i,
            description:            personal_informations.dig(:durum_bilgisi, :medeni_hal, :aciklama).titleize_tr
          },
          date_of_death:            build_date(*personal_informations.dig(:durum_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun))
        }

        place_of_registry_informations = {
          family_serial_number:     personal_informations.dig(:kayit_yeri_bilgisi, :aile_sira_no).safe_to_i,
          individual_serial_number: personal_informations.dig(:kayit_yeri_bilgisi, :birey_sira_no).safe_to_i,
          volume: {
            code:                   personal_informations.dig(:kayit_yeri_bilgisi, :cilt, :kod).safe_to_i,
            description:            personal_informations.dig(:kayit_yeri_bilgisi, :cilt, :aciklama).titleize_tr
          },
          city: {
            code:                   personal_informations.dig(:kayit_yeri_bilgisi, :il, :kod).safe_to_i,
            description:            personal_informations.dig(:kayit_yeri_bilgisi, :il, :aciklama).titleize_tr
          },
          district: {
            code:                   personal_informations.dig(:kayit_yeri_bilgisi, :ilce, :kod).safe_to_i,
            description:            personal_informations.dig(:kayit_yeri_bilgisi, :ilce, :aciklama).titleize_tr
          }
        }

        basic_informations = {
          first_name:               personal_informations.dig(:temel_bilgisi, :ad).titleize_tr,
          last_name:                personal_informations.dig(:temel_bilgisi, :soyad).titleize_tr,
          fathers_name:             personal_informations.dig(:temel_bilgisi, :baba_ad).titleize_tr,
          mothers_name:             personal_informations.dig(:temel_bilgisi, :anne_ad).titleize_tr,
          gender: {
            code:                   personal_informations.dig(:temel_bilgisi, :cinsiyet, :kod).safe_to_i,
            description:            personal_informations.dig(:temel_bilgisi, :cinsiyet, :aciklama).titleize_tr
          },
          place_of_birth:           personal_informations.dig(:temel_bilgisi, :dogum_yer).titleize_tr,
          date_of_birth:            build_date(*personal_informations.dig(:temel_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun))
        }

        personal_informations = personal_informations[:hata_bilgisi].present? ? nil : {
          id_number:                personal_informations[:tc_kimlik_no].safe_to_i,
          old_id_number:            personal_informations[:es_tc_kimlik_no].safe_to_i,
          fathers_id_number:        personal_informations[:baba_tc_kimlik_no].safe_to_i,
          mothers_id_number:        personal_informations[:anne_tc_kimlik_no].safe_to_i,
          code_of_place_of_birth:   personal_informations[:dogum_yer_kod].safe_to_i,
          basic_informations:       basic_informations,
          status_informations:      status_informations,
          place_of_registry:        place_of_registry_informations
        }

        old_identity_card_informations = informations[:nufus_cuzdani_bilgisi]
        old_identity_card_informations = old_identity_card_informations[:hata_bilgisi].present? ? nil : {
          id_number:                old_identity_card_informations[:tc_kimlik_no].safe_to_i,
          first_name:               old_identity_card_informations[:ad].titleize_tr,
          last_name:                old_identity_card_informations[:soyad].titleize_tr,
          fathers_name:             old_identity_card_informations[:baba_ad].titleize_tr,
          mothers_name:             old_identity_card_informations[:anne_ad].titleize_tr,
          place_of_birth:           old_identity_card_informations[:dogum_yer].titleize_tr,
          date_of_birth:            build_date(*old_identity_card_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          number:                   old_identity_card_informations[:no].safe_to_i,
          registration_number:      old_identity_card_informations[:cuzdan_kayit_no].safe_to_i,
          serial_number:            old_identity_card_informations[:seri],
          issuing_date:             build_date(*old_identity_card_informations[:verilme_tarih].values_at(:yil, :ay, :gun)),
          issuing_reason: {
            code:                   old_identity_card_informations.dig(:cuzdan_verilme_neden, :kod).safe_to_i,
            description:            old_identity_card_informations.dig(:cuzdan_verilme_neden, :aciklama).titleize_tr
          },
          issuing_district: {
            code:                   old_identity_card_informations.dig(:verildigi_ilce, :kod).safe_to_i,
            description:            old_identity_card_informations.dig(:verildigi_ilce, :aciklama).titleize_tr
          }
        }

        new_identity_card_photograph_informations = informations[:tckk_fotograf_bilgisi]
        new_identity_card_photograph_informations = new_identity_card_photograph_informations[:hata_bilgisi].present? ? nil : {
          id_number:                new_identity_card_photograph_informations[:tc_kimlik_no].safe_to_i,
          photograph:               new_identity_card_photograph_informations[:fotograf],
        }

        new_identity_card_informations = informations[:tckk_bilgisi]
        new_identity_card_informations = new_identity_card_informations[:hata_bilgisi].present? ? nil : {
          id_number:                new_identity_card_informations[:id_number].safe_to_i,
          first_name:               new_identity_card_informations[:ad].titleize_tr,
          last_name:                new_identity_card_informations[:soyad].titleize_tr,
          fathers_name:             new_identity_card_informations[:baba_ad].titleize_tr,
          mothers_name:             new_identity_card_informations[:anne_ad].titleize_tr,
          gender: {
            code:                   new_identity_card_informations.dig(:cinsiyet, :kod).safe_to_i,
            description:            new_identity_card_informations.dig(:cinsiyet, :aciklama).titleize_tr
          },
          place_of_birth:           new_identity_card_informations[:dogum_yer].titleize_tr,
          date_of_birth:            build_date(*new_identity_card_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          registry_number:          new_identity_card_informations[:kayit_no].safe_to_i,
          serial_number:            new_identity_card_informations[:seri_no].safe_to_i,
          date_of_expiration:       new_identity_card_informations[:son_gecerlilik_tarih] && build_date(*new_identity_card_informations[:son_gecerlilik_tarih].values_at(:yil, :ay, :gun)),
          admission_reason:         new_identity_card_informations[:basvuru_neden] && {
            code:                   new_identity_card_informations.dig(:basvuru_neden, :kod).safe_to_i,
            description:            new_identity_card_informations.dig(:basvuru_neden, :aciklama).titleize_tr,
          },
          deliverer_unit:           new_identity_card_informations[:teslim_eden_birim].titleize_tr,
          date_of_delivery:         new_identity_card_informations[:teslim_tarih] && build_date(*new_identity_card_informations[:teslim_tarih].values_at(:yil, :ay, :gun)),
          issuing_authority:        new_identity_card_informations[:veren_makam].titleize_tr,
          photograph:               new_identity_card_photograph_informations
        }

        next unless [
          temporary_identity_informations,
          personal_informations,
          old_identity_card_informations,
          new_identity_card_informations
        ].any?

        {
          temporary_identity_informations: temporary_identity_informations,
          personal_informations:           personal_informations,
          old_identity_card_informations:  old_identity_card_informations,
          new_identity_card_informations:  new_identity_card_informations
        }
      end

      attribute :foreigner_informations do
        foreigner = object.dig(:yabanci_kisi_kutukleri, :kisi_bilgisi)
        next if foreigner[:hata_bilgisi]

        basic_informations = foreigner[:temel_bilgisi]
        basic_informations = basic_informations[:hata_bilgisi].present? ? nil : {
          first_name:               basic_informations[:ad].titleize,
          last_name:                basic_informations[:soyad].titleize,
          fathers_name:             basic_informations[:baba_ad].titleize,
          mothers_name:             basic_informations[:anne_ad].titleize,
          gender: {
            code:                   basic_informations.dig(:cinsiyet, :kod).safe_to_i,
            description:            basic_informations.dig(:cinsiyet, :aciklama).titleize_tr
          },
          place_of_birth:           basic_informations[:dogum_yer].titleize
        }

        status_informations = foreigner[:durum_bilgisi]
        status_informations = status_informations[:hata_bilgisi].present? ? nil : {
          code:                     status_informations[:kod].safe_to_i,
          description:              status_informations[:aciklama].titleize_tr
        }

        admittance_informations = {
          number:                   foreigner[:izin_no].safe_to_i,
          date_of_start:            foreigner[:izin_baslangic_tarih],
          date_of_end:              foreigner[:izin_bitis_tarih],
          issuing_city: {
            code:                   foreigner.dig(:izin_duzenlenen_il, :kod).safe_to_i,
            description:            foreigner.dig(:izin_duzenlenen_il, :aciklama).titleize_tr
          }
        }

        {
          id_number:                foreigner[:kimlik_no].safe_to_i,
          mothers_id_number:        foreigner[:anne_kimlik_no].safe_to_i,
          fathers_id_number:        foreigner[:baba_kimlik_no].safe_to_i,
          old_id_number:            foreigner[:es_tc_kimlik_no].safe_to_i,
          new_id_number:            foreigner[:kazanilan_tc_kimlik_no].safe_to_i,
          real_person_id_number:    foreigner[:gercek_kisi_kimlik_no].safe_to_i,
          code_of_place_of_birth:   foreigner[:dogum_yer_kod].safe_to_i,
          date_of_birth:            build_date(*foreigner[:dogum_tarih].values_at(:yil, :ay, :gun)),
          date_of_death:            build_date(*foreigner[:olum_tarih].values_at(:yil, :ay, :gun)),
          nationality: {
            code:                   foreigner.dig(:uyruk, :kod).safe_to_i,
            description:            foreigner.dig(:uyruk, :aciklama).titleize_tr
          },
          admittance:               admittance_informations,
          source_unit: {
            code:                   foreigner.dig(:kaynak_birim, :kod).safe_to_i,
            description:            foreigner.dig(:kaynak_birim, :aciklama).titleize_tr
          },
          basic_informations:       basic_informations,
          status:                   status_informations
        }
      end
    end
  end
end