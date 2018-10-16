# frozen_string_literal: true

module Yoksis
  module Resumes
    class DesignsSerializer < Serializer
      attribute(:registry_id)            { integer        object[:p_tasarim_id]          }
      attribute(:name)                   { string         object[:tasarim_adi]           }
      attribute(:summary)                { string         object[:tasarim_ozeti]         }
      attribute(:type_id)                { integer        object[:tasarim_turu]          }
      attribute(:type_name)              { string         object[:tasarim_turu_adi]      }
      attribute(:type_detail_id)         { integer        object[:tasarim_turu_detay]    }
      attribute(:type_detail_name)       { string         object[:tasarim_turu_detay_ad] }
      attribute(:date_of_start)          { parse_date     object[:bas_tarihi]            }
      attribute(:date_of_end)            { parse_date     object[:bitis_tarih]           }
      attribute(:scope_id)               { integer        object[:kapsam]                }
      attribute(:scope_name)             { string         object[:kapsam_ad]             }
      attribute(:owners)                 { split_string   object[:tasarim_sahipleri]     }
      attribute(:title_id)               { integer        object[:unvan_id]              }
      attribute(:title_name)             { string         object[:unvan_ad]              }
      attribute(:institution_id)         { integer        object[:kurum_id]              }
      attribute(:institution_name)       { string         object[:kurum_ad]              }
      attribute(:number_of_person)       { integer        object[:kisi_sayisi]           }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]           }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]        }
      attribute(:incentive_points)       { float          object[:tesv_puan]             }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi]     }
    end
  end
end
