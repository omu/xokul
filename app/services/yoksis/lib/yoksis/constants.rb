# frozen_string_literal: true

module Services
  module Yoksis
    class Graduates < Base
      METHOD_VARIABLES = {
        informations: {
          soap_operation: :tc_kimlik_noil_mezun_ogrenci_sorgulav2,
          status_path:    %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response sonuc durum_aciklama],
          data_path:      %i[tc_kimlik_noil_mezun_ogrenci_sorgulav2_response mezun_ogrenci_kayitlari],
        },
      }.freeze
    end
    class MEB < Base
      METHOD_VARIABLES = {
        students: {
          soap_operation: :mezuniyet_verilerini_getir_detay,
          status_path:    %i[mezuniyet_verilerini_getir_detay_response mezuniyet_verilerini_getir_detay_result
                             sonuc durum_aciklama],
          data_path:      %i[mezuniyet_verilerini_getir_detay_response mezuniyet_verilerini_getir_detay_result
                             mezuniyet_veri_listesi_detay mezuniyet_veri_listesi_detay],
        },
      }.freeze
    end
    class References < Base
      METHOD_VARIABLES = {
        administrative_functions: {
          soap_operation: :get_personel_gorev,
          status_path:    %i[get_personel_gorev_response sonuc durum_aciklama],
          data_path:      %i[get_personel_gorev_response referanslar],
        },
        administrative_units: {
          soap_operation: :get_idari_birimler,
          status_path:    %i[get_idari_birimler_response sonuc durum_aciklama],
          data_path:      %i[get_idari_birimler_response idari_birimler],
        },
        cities: {
          soap_operation: :get_il_getir,
          status_path:    %i[get_il_getir_response sonuc durum_aciklama],
          data_path:      %i[get_il_getir_response il_kodu],
        },
        countries: {
          soap_operation: :get_mernis_ulke,
          status_path:    %i[get_mernis_ulke_response sonuc durum_aciklama],
          data_path:      %i[get_mernis_ulke_response referanslar],
        },
        districts: {
          soap_operation: :get_ilce_getir,
          status_path:    %i[get_ilce_getir_response sonuc durum_aciklama],
          data_path:      %i[get_ilce_getir_response ilce_kodlari],
        },
        entrance_types: {
          soap_operation: :get_giris_turu,
          status_path:    %i[get_giris_turu_response sonuc durum_aciklama],
          data_path:      %i[get_giris_turu_response referanslar],
        },
        gender: {
          soap_operation: :get_mernis_cinsiyet,
          status_path:    %i[get_mernis_cinsiyet_response sonuc durum_aciklama],
          data_path:      %i[get_mernis_cinsiyet_response referanslar],
        },
        kod_bid: {
          soap_operation: :get_kod_bid,
          status_path:    %i[get_kod_bid_response sonuc durum_aciklama],
          data_path:      %i[get_kod_bid_response referanslar],
        },
        martyrs_relatives: {
          soap_operation: :get_ogrenci_gazi_sehit_yakini,
          status_path:    %i[get_ogrenci_gazi_sehit_yakini_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_gazi_sehit_yakini_response referanslar],
        },
        nationalities: {
          soap_operation: :get_mernis_uyruk,
          status_path:    %i[get_mernis_uyruk_response sonuc durum_aciklama],
          data_path:      %i[get_mernis_uyruk_response referanslar],
        },
        staff_titles: {
          soap_operation: :get_kadro_gorev_unvan,
          status_path:    %i[get_kadro_gorev_unvan_response sonuc durum_aciklama],
          data_path:      %i[get_kadro_gorev_unvan_response referanslar],
        },
        student_disability_types: {
          soap_operation: :get_ogrenci_engel_turu,
          status_path:    %i[get_ogrenci_engel_turu_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_engel_turu_response referanslar],
        },
        student_dropout_types: {
          soap_operation: :get_ogrenci_ayrilma_nedeni,
          status_path:    %i[get_ogrenci_ayrilma_nedeni_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_ayrilma_nedeni_response referanslar],
        },
        student_education_levels: {
          soap_operation: :get_ogrenci_doykm,
          status_path:    %i[get_ogrenci_doykm_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_doykm_response referanslar],
        },
        student_entrance_point_types: {
          soap_operation: :get_ogrenci_giris_puan_turu,
          status_path:    %i[get_ogrenci_giris_puan_turu_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_giris_puan_turu_response referanslar],
        },
        student_entrance_types: {
          soap_operation: :get_ogrenci_giris_turu,
          status_path:    %i[get_ogrenci_giris_turu_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_giris_turu_response referanslar],
        },
        student_grades: {
          soap_operation: :get_ogrenci_sinif,
          status_path:    %i[get_ogrenci_sinif_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_sinif_response referanslar],
        },
        student_grading_systems: {
          soap_operation: :get_ogrenci_diploma_not_sistemi,
          status_path:    %i[get_ogrenci_diploma_not_sistemi_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_diploma_not_sistemi_response referanslar],
        },
        student_punishment_types: {
          soap_operation: :get_ceza_turu,
          status_path:    %i[get_ceza_turu_response sonuc durum_aciklama],
          data_path:      %i[get_ceza_turu_response referanslar],
        },
        studentship_rights: {
          soap_operation: :get_ogrenci_ogrencilik_hakki,
          status_path:    %i[get_ogrenci_ogrencilik_hakki_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenci_ogrencilik_hakki_response referanslar],
        },
        studentship_statuses: {
          soap_operation: :get_ogrencilik_statusu,
          status_path:    %i[get_ogrencilik_statusu_response sonuc durum_aciklama],
          data_path:      %i[get_ogrencilik_statusu_response referanslar],
        },
        unit_instruction_languages: {
          soap_operation: :get_ogrenim_dili,
          status_path:    %i[get_ogrenim_dili_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenim_dili_response referanslar],
        },
        unit_instruction_types: {
          soap_operation: :get_ogrenim_turu,
          status_path:    %i[get_ogrenim_turu_response sonuc durum_aciklama],
          data_path:      %i[get_ogrenim_turu_response referanslar],
        },
        unit_statuses: {
          soap_operation: :get_aktiflik_durumu,
          status_path:    %i[get_aktiflik_durumu_response sonuc durum_aciklama],
          data_path:      %i[get_aktiflik_durumu_response referanslar],
        },
        unit_types: {
          soap_operation: :get_birim_turu,
          status_path:    %i[get_birim_turu_response sonuc durum_aciklama],
          data_path:      %i[get_birim_turu_response referanslar],
        },
        university_types: {
          soap_operation: :get_universite_turu,
          status_path:    %i[get_universite_turu_response sonuc durum_aciklama],
          data_path:      %i[get_universite_turu_response referanslar],
        },
      }.freeze
    end
    class Resumes < Base
      METHOD_VARIABLES = {
        certifications: {
          soap_operation: :get_arastirma_sertifka_bilgisi_v1,
          status_path:    %i[get_arastirma_sertifka_bilgisi_v1_response sonuc durum_aciklama],
          data_path:      %i[get_arastirma_sertifka_bilgisi_v1_response arastirma_liste],
        },
        articles: {
          soap_operation: :get_makale_bilgisi_v1,
          status_path:    %i[get_makale_bilgisi_v1_response sonuc durum_aciklama],
          data_path:      %i[get_makale_bilgisi_v1_response makale_liste],
        },
        projects: {
          soap_operation: :getir_proje_listesi,
          status_path:    %i[getir_proje_listesi_response sonuc durum_aciklama],
          data_path:      %i[getir_proje_listesi_response proje_listesi],
        },
      }.freeze
    end
    class Staff < Base
      METHOD_VARIABLES = {
        academicians: {
          soap_operation: :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
          status_path:    %i[kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1_response
                             akademik_personel sonuc durum_aciklama],
          data_path:      %i[kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1_response
                             akademik_personel],
        },
        nationalities: {
          soap_operation: :get_mernis_uyruk,
          status_path:    %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                             sonuc durum_aciklama],
          data_path:      %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                             akademik_personeller],
        },
        pages: {
          soap_operation: :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
          status_path:    %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                             sonuc durum durum_aciklama],
          data_path:      %i[kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1_response
                             akademik_personeller],
        },
      }.freeze
    end
    class Students < Base
      METHOD_VARIABLES = {
        informations: {
          soap_operation: :tc_kimlik_noile_ogrenci_sorgula_detayv4,
          status_path:    %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response sonuc durum_aciklama],
          data_path:      %i[tc_kimlik_noile_ogrenci_sorgula_detayv4_response ogrenci_kayitlari],
        },
      }.freeze
    end
    class Units < Base
      METHOD_VARIABLES = {
        changes: {
          soap_operation: :tarihten_birim_degisiklik_getirv4,
          status_path:    %i[tarihten_birim_degisiklik_getirv4_response birimler],
          data_path:      %i[tarihten_birim_degisiklik_getirv4_response birimler],
        },
        programs: {
          soap_operation: :alt_birimdeki_programlari_getirv4,
          status_path:    %i[alt_birimleri_getirv4_response sonuc durum_aciklama],
          data_path:      %i[alt_birimleri_getirv4_response birimler],
        },
        subunits: {
          soap_operation: :alt_birimleri_getirv4,
          status_path:    %i[universiteleri_getirv4_response sonuc durum_aciklama],
          data_path:      %i[universiteleri_getirv4_response universiteler],
        },
        universities: {
          soap_operation: :universiteleri_getirv4,
          status_path:    %i[alt_birimdeki_programlari_getirv4_response sonuc durum_aciklama],
          data_path:      %i[alt_birimdeki_programlari_getirv4_response birimler],
        },
      }.freeze
    end
  end
end
