# frozen_string_literal: true

module Yoksis
  module Resumes
    class AwardsSerializer < Serializer
      attribute(:activity_detail_id)     { integer        object[:faal_detay_id]     }
      attribute(:activity_detail_name)   { string         object[:faal_detay_adi]    }
      attribute(:country_id)             { integer        object[:ulke_id]           }
      attribute(:country_name)           { string         object[:ulke_ad]           }
      attribute(:description)            { string         object[:odul_aciklama]     }
      attribute(:id)                     { integer        object[:odul_id]           }
      attribute(:incentive_point)        { float          object[:tesv_puan]         }
      attribute(:last_update)            { parse_datetime object[:guncelleme_tarihi] }
      attribute(:name)                   { string         object[:odul_adi]          }
      attribute(:number_of_participants) { integer        object[:kisi_sayisi]       }
      attribute(:type_id)                { integer        object[:odul_tur_id]       }
      attribute(:type_name)              { string         object[:odul_turu]         }
      attribute(:year)                   { integer        object[:odul_tarih]        }

      attribute :awarder do
        {
          institution_name:    string(object[:kurulus_adi]),
          workplace_type_id:   integer(object[:isyeri_turu_id]),
          workplace_type_name: string(object[:isyeri_turu_adi])
        }
      end

      attribute :conferee do
        {
          title_id:         integer(object[:p_unvan_id]),
          title_name:       string(object[:p_unvan_ad]),
          institution_id:   integer(object[:p_kurum_id]),
          institution_name: string(object[:p_kurum_ad])
        }
      end
    end
  end
end
