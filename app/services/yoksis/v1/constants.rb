# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      GRADUATE_METHODS = {
        status: :tc_kimlik_noil_mezun_ogrenci_sorgulav2
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
