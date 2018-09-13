# frozen_string_literal: true

module Services
  module Osym
    class Examination
      METHOD_VARIABLES = {
        groups: {
          operation:    :sinav_grup_bilgilerini_getir,
          status_body:  %i[sinav_grup_bilgilerini_getir_response
                           sinav_grup_bilgilerini_getir_result sonuc_kodu],
          special_body: %i[sinav_grup_bilgilerini_getir_response
                           sinav_grup_bilgilerini_getir_result sonuc sinav_grup_bilgi]
        }
      }
    end
  end
end
