# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArtisticActivitiesSerializer < Serializer
      attribute(:activity_id)            { integer        object[:aktif_pasif]       }
      attribute(:activity_name)          { string         object[:aktif_pasif_ad]    }
      attribute(:city)                   { string         object[:sehir]             }
      attribute(:country_id)             { integer        object[:ulke]              }
      attribute(:country_name)           { string         object[:ulke_adi]          }
      attribute(:duration)               { integer        object[:etkinlik_suresi]   }
      attribute(:end_date)               { parse_date     object[:bit_tarih]         }
      attribute(:incentive_point)        { float          object[:tesv_puan]         }
      attribute(:language_id)            { integer        object[:etkinlik_dili]     }
      attribute(:language_name)          { string         object[:dil_adi]           }
      attribute(:last_update)            { parse_datetime object[:guncelleme_tarihi] }
      attribute(:location)               { string         object[:etkinlik_yeri]     }
      attribute(:main_type)              { integer        object[:ana_tur]           }
      attribute(:name)                   { string         object[:etkinlik_adi]      }
      attribute(:number_of_participants) { integer        object[:kisi_sayisi]       }
      attribute(:organizers)             { split_string   object[:duzenleyenler]     }
      attribute(:scope_id)               { integer        object[:kapsam]            }
      attribute(:scope_name)             { string         object[:kapsam_ad]         }
      attribute(:start_date)             { parse_date     object[:bas_tarih]         }
      attribute(:title_id)               { integer        object[:unvan_id]          }
      attribute(:title_name)             { string         object[:unvan_ad]          }
      attribute(:type_id)                { integer        object[:etkinlik_turu]     }
      attribute(:type_name)              { string         object[:etkinlik_turu_ad]  }
      attribute(:unit_id)                { integer        object[:kurum_id]          }
      attribute(:unit_name)              { string         object[:kurum_ad]          }
      attribute(:work_type_id)           { integer        object[:tip]               }
      attribute(:work_type_name)         { string         object[:tip_adi]           }
      attribute(:yoksis_id)              { integer        object[:s_id]              }
    end
  end
end
