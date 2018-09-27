# frozen_string_literal: true

module Yoksis
  module Resumes
    class AwardsSerializer < Serializer
      attribute(:id)                { object[:odul_id].safe_to_i          }
      attribute(:name)              { object[:odul_adi].titleize_tr       }
      attribute(:description)       { object[:odul_aciklama].titleize_tr  }
      attribute(:year)              { object[:odul_tarih].safe_to_i       }
      attribute(:detail_id)         { object[:faal_detay_id].safe_to_i    }
      attribute(:detail_name)       { object[:faal_detay_adi].titleize_tr }
      attribute(:type_id)           { object[:odul_tur_id].safe_to_i      }
      attribute(:type_name)         { object[:odul_turu].titleize_tr      }
      attribute(:country_id)        { object[:ulke_id].safe_to_i          }
      attribute(:country_name)      { object[:ulke_ad].titleize_tr        }
      attribute(:number_of_persons) { object[:kisi_sayisi].titleize_tr    }

      attribute :awarder do
        {
          institution_name:    object[:kurulus_adi].titleize_tr,
          workplace_type_id:   object[:isyeri_turu_id].safe_to_i,
          workplace_type_name: object[:isyeri_turu_adi].titleize_tr
        }
      end

      attribute :conferee do
        {
          title_id:         object[:p_unvan_id].safe_to_i,
          title_name:       object[:p_unvan_ad].titleize_tr,
          institution_id:   object[:p_kurum_id].safe_to_i,
          institution_name: object[:p_kurum_ad].titleize_tr
        }
      end

      attribute(:date_of_update)   { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:incentive_points) { object[:tesv_puan].safe_to_f                                              }
    end
  end
end
