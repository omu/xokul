# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      GRADUATE_METHODS = {
        status: :tc_kimlik_noil_mezun_ogrenci_sorgulav2
      }.freeze

      MEB_METHODS = {
        graduation_data: :mezuniyet_verilerini_getir,
        detailed_graduation_data: :mezuniyet_verilerini_getir_detay
      }.freeze

      REFERENCES_METHODS = {
        unit_status: :get_aktiflik_durumu,
        unit_type: :get_birim_turu,
        student_punishment_type: :get_ceza_turu,
        entrance_type: :get_giris_turu,
        administrative_units: :get_idari_birimler,
        province: :get_il_getir,
        staff_title: :get_kadro_gorev_unvan,
        kod_bid: :get_kod_bid,
        gender: :get_mernis_cinsiyet,
        country: :get_mernis_ulke,
        nationality: :get_mernis_uyruk,
        student_dropout_type: :get_ogrenci_ayrilma_nedeni,
        student_grading_system: :get_ogrenci_diploma_not_sistemi,
        student_education_level: :get_ogrenci_doykm,
        student_disability_type: :get_ogrenci_engel_turu,
        martyrs_relatives: :get_ogrenci_sehit_gazi_yakini,
        student_entrance_point_type: :get_ogrenci_giris_puan_turu,
        student_entrance_type: :get_ogrenci_giris_turu,
        studentship_status: :get_ogrencilik_statusu,
        studentship_right: :get_ogrenci_ogrencilik_hakki,
        student_grade: :get_ogrenci_sinif,
        unit_instruction_language: :get_ogrenim_dili,
        unit_instruction_type: :get_ogrenim_turu,
        administrative_function: :get_personel_gorev,
        university_type: :get_universite_turu
      }.freeze

      REGISTRATIONS_METHODS = {
        foundation_tuition: :vakif_ogrenim_ucretiv1,
        query_according_to_specific_day: :belirtilen_gun_online_kayit_olan_ogrenciler_getirv1,
        query_with_tck: :tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1
      }.freeze

      STAFF_METHODS = {
        information: :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
        information_by_tck: :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
        nationalities: :get_mernis_uyruk,
        page_number: :kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1
      }.freeze

      STUDENT_METHODS = {
        details: :tc_kimlik_noile_ogrenci_sorgula_detayv4
      }.freeze

      UNITS_METHODS = {
        changes_in_unit: :tarihten_birim_degisiklik_getirv4,
        subunits: :alt_birimleri_getirv4,
        universities: :universiteleri_getirv4,
        programs_under_subunit: :alt_birimdeki_programlari_getirv4,
        unitname: :idden_birim_adi_getirv4
      }.freeze
    end
  end
end
