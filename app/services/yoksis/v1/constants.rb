# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      GRADUATES_METHODS = {
        status: :tc_kimlik_noil_mezun_ogrenci_sorgulav2
      }.freeze

      STUDENTS_METHODS = {
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
