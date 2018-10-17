# frozen_string_literal: true

module Yoksis
  module Resumes
    class DesignsSerializer < Serializer
      attribute(:activity_id)      { integer        object[:aktif_pasif]           }
      attribute(:activity_name)    { string         object[:aktif_pasif_ad]        }
      attribute(:end_date)         { parse_date     object[:bitis_tarih]           }
      attribute(:id)               { integer        object[:p_tasarim_id]          }
      attribute(:incentive_point)  { float          object[:tesv_puan]             }
      attribute(:last_update)      { parse_datetime object[:guncelleme_tarihi]     }
      attribute(:name)             { string         object[:tasarim_adi]           }
      attribute(:number_of_person) { integer        object[:kisi_sayisi]           }
      attribute(:owners)           { split_string   object[:tasarim_sahipleri]     }
      attribute(:scope_id)         { integer        object[:kapsam]                }
      attribute(:scope_name)       { string         object[:kapsam_ad]             }
      attribute(:start_date)       { parse_date     object[:bas_tarihi]            }
      attribute(:summary)          { string         object[:tasarim_ozeti]         }
      attribute(:title_id)         { integer        object[:unvan_id]              }
      attribute(:title_name)       { string         object[:unvan_ad]              }
      attribute(:type_detail_id)   { integer        object[:tasarim_turu_detay]    }
      attribute(:type_detail_name) { string         object[:tasarim_turu_detay_ad] }
      attribute(:type_id)          { integer        object[:tasarim_turu]          }
      attribute(:type_name)        { string         object[:tasarim_turu_adi]      }
      attribute(:unit_id)          { integer        object[:kurum_id]              }
      attribute(:unit_name)        { string         object[:kurum_ad]              }
    end
  end
end
