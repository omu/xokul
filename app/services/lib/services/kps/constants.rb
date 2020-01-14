# frozen_string_literal: true

module Services
  module Kps
    class Queries
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

    module Verifications
      ARGS = {
        id_cards_by_turkish_nationals: {
          operation: :kisi_ve_cuzdan_dogrula,
          result: %i[kisi_ve_cuzdan_dogrula_response kisi_ve_cuzdan_dogrula_result]
        },
        id_numbers: {
          operation: :tc_kimlik_no_dogrula,
          result: %i[tc_kimlik_no_dogrula_response]
        },
        id_cards_by_foreign_nationals: {
          operation: :yabanci_kimlik_no_dogrula,
          result: %i[yabanci_kimlik_no_dogrula_response yabanci_kimlik_no_dogrula_result]
        }
      }
    end
  end
end
