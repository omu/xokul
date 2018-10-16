# frozen_string_literal: true

module Kps
  module Queries
    class IdentitiesSerializer < Serializer
      attribute(:id_number) { integer object[:kimlik_no] }

      attribute :blue_card_informations do
        informations = object.dig(:mavi_kartli_kisi_kutukleri)
        next if informations[:hata_bilgisi]

        personal_informations = informations[:kisi_bilgisi]

        basic_informations = {
          first_name:               string(personal_informations.dig(:temel_bilgisi, :ad)),
          last_name:                string(personal_informations.dig(:temel_bilgisi, :soyad)),
          fathers_name:             string(personal_informations.dig(:temel_bilgisi, :baba_ad)),
          mothers_name:             string(personal_informations.dig(:temel_bilgisi, :anne_ad)),
          gender: {
            code:                   integer(personal_informations.dig(:temel_bilgisi, :cinsiyet, :kod)),
            description:            string(personal_informations.dig(:temel_bilgisi, :cinsiyet, :aciklama))
          },
          place_of_birth:           string(personal_informations.dig(:temel_bilgisi, :dogum_yer)),
          date_of_birth:            personal_informations.dig(:temel_bilgisi, :dogum_tarih) && build_date(*personal_informations.dig(:temel_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun))
        }

        status_informations = {
          status: {
            code:                   integer(personal_informations.dig(:durum_bilgisi, :durum, :kod)),
            description:            string(personal_informations.dig(:durum_bilgisi, :durum, :aciklama))
          },
          marital_status: {
            code:                   integer(personal_informations.dig(:durum_bilgisi, :medeni_hal, :kod)),
            description:            string(personal_informations.dig(:durum_bilgisi, :medeni_hal, :aciklama))
          },
          date_of_death:            personal_informations.dig(:durum_bilgisi, :olum_tarih) && build_date(*personal_informations.dig(:durum_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun))

        }

        personal_informations = personal_informations[:hata_bilgisi].present? ? nil : {
          id_number:                integer(personal_informations[:kimlik_no]),
          old_id_number:            integer(personal_informations[:es_tc_kimlik_no]),
          new_id_number:            integer(personal_informations[:kazanilan_tc_kimlik_no]),
          fathers_id_number:        integer(personal_informations[:baba_tc_kimlik_no]),
          mothers_id_number:        integer(personal_informations[:anne_tc_kimlik_no]),
          real_person_id_number:    integer(personal_informations[:gercek_kisi_kimlik_no]),
          country:                  personal_informations[:ulke] && {
            code:                   integer(personal_informations.dig(:ulke, :kod)),
            description:            string(personal_informations.dig(:ulke, :aciklama))
          },
          status_informations:      status_informations,
          basic_informations:       basic_informations
        }

        card_informations = informations[:mavi_kart_bilgisi]
        card_informations = card_informations[:hata_bilgisi].present? ? nil : {
          id_number:                integer(card_informations[:kimlik_no]),
          first_name:               string(card_informations[:ad]),
          last_name:                string(card_informations[:soyad]),
          fathers_name:             string(card_informations[:baba_ad]),
          mothers_name:             string(card_informations[:anne_ad]),
          gender: {
            code:                   integer(card_informations.dig(:cinsiyet, :kod)),
            description:            string(card_informations.dig(:cinsiyet, :aciklama))
          },
          nationality:              card_informations[:uyruk] && {
            code:                   integer(card_informations.dig(:uyruk, :kod)),
            description:            string(card_informations.dig(:uyruk, :aciklama))
          },
          marital_status: {
            code:                   integer(card_informations.dig(:medeni_hal, :kod)),
            description:            string(card_informations.dig(:medeni_hal, :aciklama))
          },
          place_of_birth:           string(card_informations[:dogum_yer]),
          code_of_place_of_birth:   integer(card_informations[:dogum_yer_kod]),
          date_of_birth:            card_informations[:dogum_tarih] && build_date(*card_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          previous_last_name:       string(card_informations[:onceki_soyad]),
          unit:                     string(card_informations[:birim]),
          number:                   integer(card_informations[:no]),
          registration_number:      integer(card_informations[:kayit_no]),
          serial_number:            string(card_informations[:seri], titleize_turkish: false),
          issuing_reason:           card_informations[:verilis_neden] && {
            code:                   integer(card_informations.dig(:verilis_neden, :kod)),
            description:            string(card_informations.dig(:verilis_neden, :aciklama))
          },
          issuing_date:             card_informations[:verilme_tarih] && build_date(*card_informations[:verilme_tarih].values_at(:yil, :ay, :gun))
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
          id_number:                integer(temporary_identity_informations[:tc_kimlik_no]),
          first_name:               string(temporary_identity_informations[:ad]),
          last_name:                integer(temporary_identity_informations[:soyad]),
          fathers_name:             string(temporary_identity_informations[:baba_ad]),
          mothers_name:             string(temporary_identity_informations[:anne_ad]),
          gender: {
            code:                   integer(temporary_identity_informations.dig(:cinsiyet, :kod)),
            description:            string(temporary_identity_informations.dig(:cinsiyet, :aciklama))
          },
          date_of_birth:            temporary_identity_informations[:dogum_tarih]          && build_date(*temporary_identity_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          previous_last_name:       string(temporary_identity_informations[:onceki_soyad]),
          document_number:          integer(temporary_identity_informations[:belge_no]),
          issuing_district:         string(temporary_identity_informations[:duzenleyen_ilce]),
          issuing_date:             temporary_identity_informations[:duzenlenme_tarih]     && build_date(*temporary_identity_informations[:duzenlenme_tarih].values_at(:yil, :ay, :gun)),
          date_of_expiration:       temporary_identity_informations[:son_gecerlilik_tarih] && build_date(*temporary_identity_informations[:son_gecerlilik_tarih].values_at(:yil, :ay, :gun))
        }

        personal_informations = informations[:kisi_bilgisi]

        status_informations = {
          religion:                 string(personal_informations.dig(:durum_bilgisi, :din)),
          status: {
            code:                   integer(personal_informations.dig(:durum_bilgisi, :durum, :kod)),
            description:            string(personal_informations.dig(:durum_bilgisi, :durum, :aciklama))
          },
          marital_status: {
            code:                   integer(personal_informations.dig(:durum_bilgisi, :medeni_hal, :kod)),
            description:            string(personal_informations.dig(:durum_bilgisi, :medeni_hal, :aciklama))
          },
          date_of_death:            personal_informations.dig(:durum_bilgisi, :olum_tarih) && build_date(*personal_informations.dig(:durum_bilgisi, :olum_tarih).values_at(:yil, :ay, :gun))
        }

        place_of_registry_informations = {
          family_serial_number:     integer(personal_informations.dig(:kayit_yeri_bilgisi, :aile_sira_no)),
          individual_serial_number: integer(personal_informations.dig(:kayit_yeri_bilgisi, :birey_sira_no)),
          volume: {
            code:                   integer(personal_informations.dig(:kayit_yeri_bilgisi, :cilt, :kod)),
            description:            string(personal_informations.dig(:kayit_yeri_bilgisi, :cilt, :aciklama))
          },
          city: {
            code:                   integer(personal_informations.dig(:kayit_yeri_bilgisi, :il, :kod)),
            description:            string(personal_informations.dig(:kayit_yeri_bilgisi, :il, :aciklama))
          },
          district: {
            code:                   integer(personal_informations.dig(:kayit_yeri_bilgisi, :ilce, :kod)),
            description:            string(personal_informations.dig(:kayit_yeri_bilgisi, :ilce, :aciklama))
          }
        }

        basic_informations = {
          first_name:               string(personal_informations.dig(:temel_bilgisi, :ad)),
          last_name:                string(personal_informations.dig(:temel_bilgisi, :soyad)),
          fathers_name:             string(personal_informations.dig(:temel_bilgisi, :baba_ad)),
          mothers_name:             string(personal_informations.dig(:temel_bilgisi, :anne_ad)),
          gender: {
            code:                   integer(personal_informations.dig(:temel_bilgisi, :cinsiyet, :kod)),
            description:            string(personal_informations.dig(:temel_bilgisi, :cinsiyet, :aciklama))
          },
          place_of_birth:           string(personal_informations.dig(:temel_bilgisi, :dogum_yer)),
          date_of_birth:            personal_informations.dig(:temel_bilgisi, :dogum_tarih) && build_date(*personal_informations.dig(:temel_bilgisi, :dogum_tarih).values_at(:yil, :ay, :gun))
        }

        personal_informations = personal_informations[:hata_bilgisi].present? ? nil : {
          id_number:                integer(personal_informations[:tc_kimlik_no]),
          old_id_number:            integer(personal_informations[:es_tc_kimlik_no]),
          fathers_id_number:        integer(personal_informations[:baba_tc_kimlik_no]),
          mothers_id_number:        integer(personal_informations[:anne_tc_kimlik_no]),
          code_of_place_of_birth:   integer(personal_informations[:dogum_yer_kod]),
          basic_informations:       basic_informations,
          status_informations:      status_informations,
          place_of_registry:        place_of_registry_informations
        }

        old_identity_card_informations = informations[:nufus_cuzdani_bilgisi]
        old_identity_card_informations = old_identity_card_informations[:hata_bilgisi].present? ? nil : {
          id_number:                integer(old_identity_card_informations[:tc_kimlik_no]),
          first_name:               string(old_identity_card_informations[:ad]),
          last_name:                string(old_identity_card_informations[:soyad]),
          fathers_name:             string(old_identity_card_informations[:baba_ad]),
          mothers_name:             string(old_identity_card_informations[:anne_ad]),
          place_of_birth:           string(old_identity_card_informations[:dogum_yer]),
          date_of_birth:            old_identity_card_informations[:dogum_tarih] && build_date(*old_identity_card_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          number:                   integer(old_identity_card_informations[:no]),
          registration_number:      integer(old_identity_card_informations[:cuzdan_kayit_no]),
          serial_number:            string(old_identity_card_informations[:seri], titleize_turkish: false),
          issuing_date:             old_identity_card_informations[:verilme_tarih] && build_date(*old_identity_card_informations[:verilme_tarih].values_at(:yil, :ay, :gun)),
          issuing_reason: {
            code:                   integer(old_identity_card_informations.dig(:cuzdan_verilme_neden, :kod)),
            description:            string(old_identity_card_informations.dig(:cuzdan_verilme_neden, :aciklama))
          },
          issuing_district: {
            code:                   integer(old_identity_card_informations.dig(:verildigi_ilce, :kod)),
            description:            string(old_identity_card_informations.dig(:verildigi_ilce, :aciklama))
          }
        }

        new_identity_card_photograph_informations = informations[:tckk_fotograf_bilgisi]
        new_identity_card_photograph_informations = new_identity_card_photograph_informations[:hata_bilgisi].present? ? nil : {
          id_number:                integer(new_identity_card_photograph_informations[:tc_kimlik_no]),
          photograph:               string(new_identity_card_photograph_informations[:fotograf], titleize_turkish: false),
        }

        new_identity_card_informations = informations[:tckk_bilgisi]
        new_identity_card_informations = new_identity_card_informations[:hata_bilgisi].present? ? nil : {
          id_number:                integer(new_identity_card_informations[:id_number]),
          first_name:               string(new_identity_card_informations[:ad]),
          last_name:                string(new_identity_card_informations[:soyad]),
          fathers_name:             string(new_identity_card_informations[:baba_ad]),
          mothers_name:             string(new_identity_card_informations[:anne_ad]),
          gender: {
            code:                   integer(new_identity_card_informations.dig(:cinsiyet, :kod)),
            description:            string(new_identity_card_informations.dig(:cinsiyet, :aciklama))
          },
          place_of_birth:           string(new_identity_card_informations[:dogum_yer]),
          date_of_birth:            new_identity_card_informations[:dogum_tarih] && build_date(*new_identity_card_informations[:dogum_tarih].values_at(:yil, :ay, :gun)),
          registry_number:          integer(new_identity_card_informations[:kayit_no]),
          serial_number:            integer(new_identity_card_informations[:seri_no]),
          date_of_expiration:       new_identity_card_informations[:son_gecerlilik_tarih] && build_date(*new_identity_card_informations[:son_gecerlilik_tarih].values_at(:yil, :ay, :gun)),
          admission_reason:         new_identity_card_informations[:basvuru_neden] && {
            code:                   integer(new_identity_card_informations.dig(:basvuru_neden, :kod)),
            description:            string(new_identity_card_informations.dig(:basvuru_neden, :aciklama)),
          },
          deliverer_unit:           string(new_identity_card_informations[:teslim_eden_birim]),
          date_of_delivery:         new_identity_card_informations[:teslim_tarih] && build_date(*new_identity_card_informations[:teslim_tarih].values_at(:yil, :ay, :gun)),
          issuing_authority:        string(new_identity_card_informations[:veren_makam]),
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
          first_name:               string(basic_informations[:ad],        ->(p) { p.titleize }, titleize_turkish: false),
          last_name:                string(basic_informations[:soyad],     ->(p) { p.titleize }, titleize_turkish: false),
          fathers_name:             string(basic_informations[:baba_ad],   ->(p) { p.titleize }, titleize_turkish: false),
          mothers_name:             string(basic_informations[:anne_ad],   ->(p) { p.titleize }, titleize_turkish: false),
          gender: {
            code:                   integer(basic_informations.dig(:cinsiyet, :kod)),
            description:            string(basic_informations.dig(:cinsiyet, :aciklama))
          },
          place_of_birth:           string(basic_informations[:dogum_yer], ->(p) { p.titleize }, titleize_turkish: false)
        }

        status_informations = foreigner[:durum_bilgisi]
        status_informations = status_informations[:hata_bilgisi].present? ? nil : {
          code:                     integer(status_informations[:kod]),
          description:              string(status_informations[:aciklama])
        }

        admittance_informations = {
          number:                   integer(foreigner[:izin_no]),
          date_of_start:            parse_date(foreigner[:izin_baslangic_tarih]),
          date_of_end:              parse_date(foreigner[:izin_bitis_tarih]),
          issuing_city: {
            code:                   integer(foreigner.dig(:izin_duzenlenen_il, :kod)),
            description:            string(foreigner.dig(:izin_duzenlenen_il, :aciklama))
          }
        }

        {
          id_number:                integer(foreigner[:kimlik_no]),
          mothers_id_number:        integer(foreigner[:anne_kimlik_no]),
          fathers_id_number:        integer(foreigner[:baba_kimlik_no]),
          old_id_number:            integer(foreigner[:es_tc_kimlik_no]),
          new_id_number:            integer(foreigner[:kazanilan_tc_kimlik_no]),
          real_person_id_number:    integer(foreigner[:gercek_kisi_kimlik_no]),
          code_of_place_of_birth:   integer(foreigner[:dogum_yer_kod]),
          date_of_birth:            foreigner[:dogum_tarih] && build_date(*foreigner[:dogum_tarih].values_at(:yil, :ay, :gun)),
          date_of_death:            foreigner[:olum_tarih] && build_date(*foreigner[:olum_tarih].values_at(:yil, :ay, :gun)),
          nationality: {
            code:                   integer(foreigner.dig(:uyruk, :kod)),
            description:            string(foreigner.dig(:uyruk, :aciklama))
          },
          admittance:               admittance_informations,
          source_unit: {
            code:                   integer(foreigner.dig(:kaynak_birim, :kod)),
            description:            string(foreigner.dig(:kaynak_birim, :aciklama))
          },
          basic_informations:       basic_informations,
          status:                   status_informations
        }
      end
    end
  end
end