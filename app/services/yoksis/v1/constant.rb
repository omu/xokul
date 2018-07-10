# frozen_string_literal: true

module Services
  module YOKSIS
    module V1
      UNITS_METHODS = {
        changes: :alt_birimdeki_programlari_getirv4,
        subunits: :alt_birimleri_getirv4,
        universities: :universiteleri_getirv4
      }.freeze
    end
  end
end
