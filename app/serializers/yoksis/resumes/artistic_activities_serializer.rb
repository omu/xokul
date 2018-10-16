# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArtisticActivitiesSerializer < Serializer
      attribute(:registry_id)            { integer        object[:s_id]              }
      attribute(:name)                   { string         object[:etkinlik_adi]      }
      attribute(:place)                  { string         object[:etkinlik_yeri]     }
      attribute(:type_id)                { integer        object[:etkinlik_turu]     }
      attribute(:type_name)              { string         object[:etkinlik_turu_ad]  }
      attribute(:duration)               { integer        object[:etkinlik_suresi]   }
      attribute(:scope_id)               { integer        object[:kapsam]            }
      attribute(:scope_name)             { string         object[:kapsam_ad]         }
      attribute(:language_id)            { integer        object[:etkinlik_dili]     }
      attribute(:language_name)          { string         object[:dil_adi]           }
      attribute(:date_of_start)          { parse_date     object[:bas_tarih]         }
      attribute(:date_of_end)            { parse_date     object[:bit_tarih]         }
      attribute(:organizers)             { split_string   object[:duzenleyenler]     }
      attribute(:number_of_person)       { integer        object[:kisi_sayisi]       }
      attribute(:country_id)             { integer        object[:ulke]              }
      attribute(:country_name)           { string         object[:ulke_adi]          }
      attribute(:city)                   { string         object[:sehir]             }
      attribute(:title_id)               { integer        object[:unvan_id]          }
      attribute(:title_name)             { string         object[:unvan_ad]          }
      attribute(:institution_id)         { integer        object[:kurum_id]          }
      attribute(:institution_name)       { string         object[:kurum_ad]          }
      attribute(:work_type_id)           { integer        object[:tip]               }
      attribute(:work_type_name)         { string         object[:tip_adi]           }
      attribute(:main_type_id)           { integer        object[:ana_tur]           }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:incentive_points)       { float          object[:tesv_puan]         }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }
    end
  end
end
