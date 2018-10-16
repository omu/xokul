# frozen_string_literal: true

module Yoksis
  module Resumes
    class RefereeingSerializer < Serializer
      attribute(:publishing_id)            { integer        object[:yayin_id]                        }
      attribute(:publishing_place)         { string         object[:yayin_yeri]                      }
      attribute(:publishing_language_id)   { integer        object[:yayin_dili]                      }
      attribute(:publishing_language_name) { string         object[:yayin_dili_adi]                  }
      attribute(:type_id)                  { integer        object[:hakemlik_turu]                   }
      attribute(:type_name)                { string         object[:hakemlik_turu_ad]                }
      attribute(:number_of_refereeing)     { integer        object[:hakemlik_sayisi]                 }
      attribute(:scope_id)                 { integer        object[:kapsam_id]                       }
      attribute(:scope_name)               { string         object[:kapsam_ad]                       }
      attribute(:country_id)               { integer        object[:ulke]                            }
      attribute(:country_name)             { string         object[:ulke_adi]                        }
      attribute(:city)                     { string         object[:sehir]                           }
      attribute(:index_id)                 { integer        object[:endeks_id]                       }
      attribute(:index)                    { string         object[:endeks], titleize_turkish: false }
      attribute(:year)                     { integer        object[:yil]                             }
      attribute(:field)                    { string         object[:alan_bilgisi]                    }
      attribute(:keywords)                 { string         object[:anahtar_kelime]                  }
      attribute(:active_or_passive_id)     { integer        object[:aktif_pasif]                     }
      attribute(:active_or_passive_name)   { string         object[:aktif_pasif_ad]                  }
      attribute(:incentive_points)         { float          object[:tesv_puan]                       }
      attribute(:date_of_update)           { parse_datetime object[:guncelleme_tarihi]               }
    end
  end
end
