# frozen_string_literal: true

module Services
  module Yoksis
    module V1
      GRADUATE_METHODS = {
        status:                            :tc_kimlik_noil_mezun_ogrenci_sorgulav2,
      }.freeze
      REFERENCES_METHODS = {
        administrative_function:           :get_personel_gorev,
        administrative_units:              :get_idari_birimler,
        country:                           :get_mernis_ulke,
        entrance_type:                     :get_giris_turu,
        gender:                            :get_mernis_cinsiyet,
        kod_bid:                           :get_kod_bid,
        martyrs_relatives:                 :get_ogrenci_sehit_gazi_yakini,
        nationality:                       :get_mernis_uyruk,
        province:                          :get_il_getir,
        staff_title:                       :get_kadro_gorev_unvan,
        student_disability_type:           :get_ogrenci_engel_turu,
        student_dropout_type:              :get_ogrenci_ayrilma_nedeni,
        student_education_level:           :get_ogrenci_doykm,
        student_entrance_point_type:       :get_ogrenci_giris_puan_turu,
        student_entrance_type:             :get_ogrenci_giris_turu,
        student_grade:                     :get_ogrenci_sinif,
        student_grading_system:            :get_ogrenci_diploma_not_sistemi,
        student_punishment_type:           :get_ceza_turu,
        studentship_right:                 :get_ogrenci_ogrencilik_hakki,
        studentship_status:                :get_ogrencilik_statusu,
        unit_instruction_language:         :get_ogrenim_dili,
        unit_instruction_type:             :get_ogrenim_turu,
        unit_status:                       :get_aktiflik_durumu,
        unit_type:                         :get_birim_turu,
        university_type:                   :get_universite_turu,
      }.freeze
      REGISTRATIONS_METHODS = {
        foundation_tuition:                :vakif_ogrenim_ucretiv1,
        query_according_to_specific_day:   :belirtilen_gun_online_kayit_olan_ogrenciler_getirv1,
        query_with_tck:                    :tc_kimlik_no_ile_online_kayit_ogrenci_bilgi_getirv1,
      }.freeze
      STAFF_METHODS = {
        information_by_tck:                :kullaniciya_gore_tc_kimlik_nodan_akademik_personel_bilgisiv1,
        information:                       :kullaniciya_gore_universitedeki_akademik_personel_bilgisiv1,
        nationalities:                     :get_mernis_uyruk,
        page_number:                       :kullaniciya_gore_universiteki_akademik_personel_sayfa_sayisiv1,
      }.freeze
      STUDENT_METHODS = {
        details:                           :tc_kimlik_noile_ogrenci_sorgula_detayv4,
      }.freeze
      UNITS_METHODS = {
        changes_in_unit:                   :tarihten_birim_degisiklik_getirv4,
        programs_under_subunit:            :alt_birimdeki_programlari_getirv4,
        subunits:                          :alt_birimleri_getirv4,
        unitname:                          :idden_birim_adi_getirv4,
        universities:                      :universiteleri_getirv4,
      }.freeze
    end
  end
end
