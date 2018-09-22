# frozen_string_literal: true

module Services
  module Kps
    class Queries < Base
      ARGS = {
        addresses: {
          operation: :adres_sorgula,
          result:  %i[adres_sorgula_response return sorgula_result sorgu_sonucu
                      kimlik_noile_kisi_adres_bilgileri],
          status: %i[adres_sorgula_response return sorgula_result sorgu_sonucu
                     kimlik_noile_kisi_adres_bilgileri hata_bilgisi]
        },
        identities: {
          operation: :sorgula,
          result: %i[sorgula_response return sorgula_result sorgu_sonucu bilesik_kutuk_bilgileri],
          status: %i[sorgula_response return sorgula_result sorgu_sonucu bilesik_kutuk_bilgileri
                     hata_bilgisi]
        }
      }
    end

    class Verifications < Base
      ARGS = {
        identities: {
          operation: :tc_kimlik_no_dogrula,
          result: %i[tc_kimlik_no_dogrula_response]
        }
      }
    end
  end
end