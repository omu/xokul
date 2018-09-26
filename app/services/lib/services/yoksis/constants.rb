# frozen_string_literal: true

module Services
  module Yoksis
    class Graduates < Base
      ARGS = {
        informations: {
          operation: :tc_kimlik_noil_mezun_ogrenci_sorgulav2,
          result: %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response mezun_ogrenci_kayitlari],
          status: %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response sonuc durum_aciklama]
        }
      }.freeze
    end
    class MEB < Base
      ARGS = {
        students: {
          operation: :mezuniyet_verilerini_getir_detay,
          result: %i[
            mezuniyet_verilerini_getir_detay_response mezuniyet_verilerini_getir_detay_result
            mezuniyet_veri_listesi_detay mezuniyet_veri_listesi_detay
          ],
          status: %i[
            mezuniyet_verilerini_getir_detay_response mezuniyet_verilerini_getir_detay_result
            sonuckodu
          ]
        }
      }.freeze
    end
    class References < Base
      ARGS = {
        administrative_functions: {
          operation: :get_personel_gorev,
          result: %i[get_personel_gorev_response referanslar],
          status: %i[get_personel_gorev_response sonuc durum_aciklama],
        },
        administrative_units: {
          operation: :get_idari_birimler,
          result: %i[get_idari_birimler_response idari_birimler],
          status: %i[get_idari_birimler_response sonuc durum_aciklama],
        },
        cities: {
          operation: :get_il_getir,
          result: %i[get_il_getir_response il_kodu],
          status: %i[get_il_getir_response sonuc durum_aciklama],
        },
        countries: {
          operation: :get_mernis_ulke,
          result: %i[get_mernis_ulke_response referanslar],
          status: %i[get_mernis_ulke_response sonuc durum_aciklama],
        },
        districts: {
          operation: :get_ilce_getir,
          result: %i[get_ilce_getir_response ilce_kodlari],
          status: %i[get_ilce_getir_response sonuc durum_aciklama],
        },
        entrance_types: {
          operation: :get_giris_turu,
          result: %i[get_giris_turu_response referanslar],
          status: %i[get_giris_turu_response sonuc durum_aciklama],
        },
        gender: {
          operation: :get_mernis_cinsiyet,
          result: %i[get_mernis_cinsiyet_response referanslar],
          status: %i[get_mernis_cinsiyet_response sonuc durum_aciklama],
        },
        kod_bid: {
          operation: :get_kod_bid,
          result: %i[get_kod_bid_response referanslar],
          status: %i[get_kod_bid_response sonuc durum_aciklama],
        },
        martyrs_relatives: {
          operation: :get_ogrenci_gazi_sehit_yakini,
          result: %i[get_ogrenci_gazi_sehit_yakini_response referanslar],
          status: %i[get_ogrenci_gazi_sehit_yakini_response sonuc durum_aciklama],
        },
        nationalities: {
          operation: :get_mernis_uyruk,
          result: %i[get_mernis_uyruk_response referanslar],
          status: %i[get_mernis_uyruk_response sonuc durum_aciklama],
        },
        staff_titles: {
          operation: :get_kadro_gorev_unvan,
          result: %i[get_kadro_gorev_unvan_response referanslar],
          status: %i[get_kadro_gorev_unvan_response sonuc durum_aciklama],
        },
        student_disability_types: {
          operation: :get_ogrenci_engel_turu,
          result: %i[get_ogrenci_engel_turu_response referanslar],
          status: %i[get_ogrenci_engel_turu_response sonuc durum_aciklama],
        },
        student_dropout_types: {
          operation: :get_ogrenci_ayrilma_nedeni,
          result: %i[get_ogrenci_ayrilma_nedeni_response referanslar],
          status: %i[get_ogrenci_ayrilma_nedeni_response sonuc durum_aciklama],
        },
        student_education_levels: {
          operation: :get_ogrenci_doykm,
          result: %i[get_ogrenci_doykm_response referanslar],
          status: %i[get_ogrenci_doykm_response sonuc durum_aciklama],
        },
        student_entrance_point_types: {
          operation: :get_ogrenci_giris_puan_turu,
          result: %i[get_ogrenci_giris_puan_turu_response referanslar],
          status: %i[get_ogrenci_giris_puan_turu_response sonuc durum_aciklama],
        },
        student_entrance_types: {
          operation: :get_ogrenci_giris_turu,
          result: %i[get_ogrenci_giris_turu_response referanslar],
          status: %i[get_ogrenci_giris_turu_response sonuc durum_aciklama],
        },
        student_grades: {
          operation: :get_ogrenci_sinif,
          result: %i[get_ogrenci_sinif_response referanslar],
          status: %i[get_ogrenci_sinif_response sonuc durum_aciklama],
        },
        student_grading_systems: {
          operation: :get_ogrenci_diploma_not_sistemi,
          result: %i[get_ogrenci_diploma_not_sistemi_response referanslar],
          status: %i[get_ogrenci_diploma_not_sistemi_response sonuc durum_aciklama],
        },
        student_punishment_types: {
          operation: :get_ceza_turu,
          result: %i[get_ceza_turu_response referanslar],
          status: %i[get_ceza_turu_response sonuc durum_aciklama],
        },
        studentship_rights: {
          operation: :get_ogrenci_ogrencilik_hakki,
          result: %i[get_ogrenci_ogrencilik_hakki_response referanslar],
          status: %i[get_ogrenci_ogrencilik_hakki_response sonuc durum_aciklama],
        },
        studentship_statuses: {
          operation: :get_ogrencilik_statusu,
          result: %i[get_ogrencilik_statusu_response referanslar],
          status: %i[get_ogrencilik_statusu_response sonuc durum_aciklama],
        },
        unit_instruction_languages: {
          operation: :get_ogrenim_dili,
          result: %i[get_ogrenim_dili_response referanslar],
          status: %i[get_ogrenim_dili_response sonuc durum_aciklama],
        },
        unit_instruction_types: {
          operation: :get_ogrenim_turu,
          result: %i[get_ogrenim_turu_response referanslar],
          status: %i[get_ogrenim_turu_response sonuc durum_aciklama],
        },
        unit_statuses: {
          operation: :get_aktiflik_durumu,
          result: %i[get_aktiflik_durumu_response referanslar],
          status: %i[get_aktiflik_durumu_response sonuc durum_aciklama],
        },
        unit_types: {
          operation: :get_birim_turu,
          result: %i[get_birim_turu_response referanslar],
          status: %i[get_birim_turu_response sonuc durum_aciklama],
        },
        university_types: {
          operation: :get_universite_turu,
          result: %i[get_universite_turu_response referanslar],
          status: %i[get_universite_turu_response sonuc durum_aciklama],
        },
      }.freeze
    end
    class Resumes < Base
      ARGS = {
        academic_duties: {
          operation: :getir_akademik_gorev_listesi,
          result: %i[getir_akademik_gorev_listesi_response akademik_gorev_listesi],
          status: %i[getir_akademik_gorev_listesi_response sonuc durum_kodu],
        },
        administrative_duties: {
          operation: :getir_idari_gorev_listesi,
          result: %i[getir_idari_gorev_listesi_response idari_gorev_listesi],
          status: %i[getir_idari_gorev_listesi_response sonuc durum_kodu],
        },
        articles: {
          operation: :get_makale_bilgisi_v1,
          result: %i[get_makale_bilgisi_v1_response makale_liste],
          status: %i[get_makale_bilgisi_v1_response sonuc durum_kodu]
        },
        certifications: {
          operation: :get_arastirma_sertifka_bilgisi_v1,
          result: %i[get_arastirma_sertifka_bilgisi_v1_response arastirma_liste],
          status: %i[get_arastirma_sertifka_bilgisi_v1_response sonuc durum_kodu]
        },
        citations: {
          operation: :get_atif_sayilari_v1,
          result: %i[get_atif_sayilari_v1_response atif_sayi_listesi],
          status: %i[get_atif_sayilari_v1_response sonuc durum_kodu],
        },
        editorships: {
          operation: :get_editorluk_bilgisi_v1,
          result: %i[get_editorluk_bilgisi_v1_response editorluk_liste],
          status: %i[get_editorluk_bilgisi_v1_response sonuc durum_kodu],
        },
        lectures: {
          operation: :getir_ders_listesi,
          result: %i[getir_ders_listesi_response ders_listesi],
          status: %i[getir_ders_listesi_response sonuc durum_kodu],
        },
        other_experiences: {
          operation: :getir_unv_disi_deneyim_listesi,
          result: %i[getir_unv_disi_deneyim_listesi_response deneyim_listesi],
          status: %i[getir_unv_disi_deneyim_listesi_response sonuc durum_kodu],
        },
        papers: {
          operation: :get_bildiri_bilgisi_v1,
          result: %i[get_bildiri_bilgisi_v1_response bildiri_liste],
          status: %i[get_bildiri_bilgisi_v1_response sonuc durum_kodu],
        },
        projects: {
          operation: :getir_proje_listesi,
          result: %i[getir_proje_listesi_response proje_listesi],
          status: %i[getir_proje_listesi_response sonuc durum_kodu]
        },
        refereeing: {
          operation: :get_hakemlik_bilgisi_v1,
          result: %i[get_hakemlik_bilgisi_v1_response hakemlik_liste],
          status: %i[get_hakemlik_bilgisi_v1_response sonuc durum_kodu]
        },
        thesis_advisors: {
          operation: :getir_tez_danisman_listesi,
          result: %i[getir_tez_danisman_listesi_response tez_danisman_listesi],
          status: %i[getir_tez_danisman_listesi_response sonuc durum_kodu]
        },
      }.freeze
    end
    class Staff < Base
      ARGS = {
        academicians: {
          operation: :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
          result: %i[kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1_response
                     akademik_personel],
        },
        nationalities: {
          operation: :get_mernis_uyruk,
          result: %i[get_mernis_uyruk_response referanslar],
          status: %i[get_mernis_uyruk_response sonuc durum_aciklama],
        },
        pages: {
          operation: :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
          result: %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                     akademik_personeller],
          status: %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                     sonuc durum_aciklama],
        },
      }.freeze
    end
    class Students < Base
      ARGS = {
        informations: {
          operation: :tc_kimlik_noile_ogrenci_sorgula_detayv4,
          result: %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari],
          status: %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response sonuc durum_aciklama],
        },
      }.freeze
    end
    class Units < Base
      ARGS = {
        changes: {
          operation: :tarihten_birim_degisiklik_getirv4,
          result: %i[tarihten_birim_degisiklik_getirv4_response birimler],
          status: %i[tarihten_birim_degisiklik_getirv4_response sonuc durum_aciklama],
        },
        units: {
          operation: :i_dden_birim_adi_getirv4,
          result: %i[i_dden_birim_adi_getirv4_response birim],
          status: %i[i_dden_birim_adi_getirv4_response sonuc durum_aciklama],
        },
        universities: {
          operation: :universiteleri_getirv4,
          result: %i[universiteleri_getirv4_response universiteler],
          status: %i[universiteleri_getirv4_response sonuc durum_aciklama],
        },
        programs: {
          operation: :alt_birimdeki_programlari_getirv4,
          result: %i[alt_birimdeki_programlari_getirv4_response birimler],
          status: %i[alt_birimdeki_programlari_getirv4_response sonuc durum_aciklama],
        },
        subunits: {
          operation: :alt_birimleri_getirv4,
          result: %i[alt_birimleri_getirv4_response birimler],
          status: %i[alt_birimleri_getirv4_response sonuc durum_aciklama],
        },
      }.freeze
    end
  end
end
