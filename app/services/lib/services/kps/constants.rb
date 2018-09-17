# frozen_string_literal: true

module Services
  module Kps
    class Queries < Base
      METHOD_VARIABLES = {
        addresses: {
          operation:    :adres_sorgula,
          status_body:  %i[adres_sorgula_response return sorgula_result sorgu_sonucu kimlik_noile_kisi_adres_bilgileri
                           hata_bilgisi],
          special_body: %i[adres_sorgula_response return sorgula_result sorgu_sonucu
                           kimlik_noile_kisi_adres_bilgileri]
        },
        identities: {
          operation:    :sorgula,
          status_body:  %i[sorgula_response return sorgula_result sorgu_sonucu bilesik_kutuk_bilgileri
                           hata_bilgisi],
          special_body: %i[sorgula_response return sorgula_result sorgu_sonucu
                           bilesik_kutuk_bilgileri]
        }
      }
    end

    class Verifications < Base
      METHOD_VARIABLES = {
        identities: {
          operation:    :tc_kimlik_no_dogrula,
          special_body: %i[tc_kimlik_no_dogrula_response]
        }
      }
    end
  end
end
