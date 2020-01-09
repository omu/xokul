# frozen_string_literal: true

module Services
  module Osym
    class Examination
      ARGS = {
        groups: {
          operation: :sinav_grup_bilgilerini_getir,
          result: %i[sinav_grup_bilgilerini_getir_response sinav_grup_bilgilerini_getir_result
            sonuc sinav_grup_bilgi],
          status: %i[sinav_grup_bilgilerini_getir_response sinav_grup_bilgilerini_getir_result
                     sonuc_kodu]
        },
        result_informations: {
          operation: :sinav_sonuclari_getir,
          result: %i[sinav_sonuclari_getir_response sinav_sonuclari_getir_result sonuc
                     sinav_sonuc_temel_bilgi],
          status: %i[sinav_sonuclari_getir_response sinav_sonuclari_getir_result sonuc_kodu]
        },
        results: {
          operation: :sinav_sonuc_xml,
          result: %i[sinav_sonuc_xml_response sinav_sonuc_xml_result sonuc],
          status: %i[sinav_sonuc_xml_response sinav_sonuc_xml_result sonuc_kodu]
        }
      }
    end
  end
end
