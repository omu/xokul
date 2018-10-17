# frozen_string_literal: true

module Yoksis
  module Resumes
    class RefereeingSerializer < Serializer
      attribute(:activity_id)               { integer        object[:aktif_pasif]                    }
      attribute(:activity_name)             { string         object[:aktif_pasif_ad]                 }
      attribute(:city)                      { string         object[:sehir]                          }
      attribute(:country_id)                { integer        object[:ulke]                           }
      attribute(:country_name)              { string         object[:ulke_adi]                       }
      attribute(:discipline)                { string         object[:alan_bilgisi]                   }
      attribute(:incentive_point)           { float          object[:tesv_puan]                      }
      attribute(:index)                     { string         object[:endeks], case_conversion: false }
      attribute(:index_id)                  { integer        object[:endeks_id]                      }
      attribute(:keywords)                  { split_string   object[:anahtar_kelime]                 }
      attribute(:last_update)               { parse_datetime object[:guncelleme_tarihi]              }
      attribute(:number_of_refereeing)      { integer        object[:hakemlik_sayisi]                }
      attribute(:publication_id)            { integer        object[:yayin_id]                       }
      attribute(:publication_language_id)   { integer        object[:yayin_dili]                     }
      attribute(:publication_language_name) { string         object[:yayin_dili_adi]                 }
      attribute(:publication_place)         { string         object[:yayin_yeri]                     }
      attribute(:scope_id)                  { integer        object[:kapsam_id]                      }
      attribute(:scope_name)                { string         object[:kapsam_ad]                      }
      attribute(:type_id)                   { integer        object[:hakemlik_turu]                  }
      attribute(:type_name)                 { string         object[:hakemlik_turu_ad]               }
      attribute(:year)                      { integer        object[:yil]                            }
    end
  end
end
