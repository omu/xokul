# frozen_string_literal: true

module Yoksis
  module Resumes
    class MembershipsSerializer < Serializer
      attribute(:activity_id)    { integer        object[:aktif_pasif]       }
      attribute(:activity_name)  { string         object[:aktif_pasif_ad]    }
      attribute(:date_of_update) { parse_datetime object[:guncelleme_tarihi] }
      attribute(:end_date)       { integer        object[:bit_tar]           }
      attribute(:id)             { integer        object[:uyelik_id]         }
      attribute(:start_date)     { integer        object[:bas_tar]           }
      attribute(:status_id)      { integer        object[:uyelik_durumu]     }
      attribute(:status_name)    { string         object[:uyelik_durumu_ad]  }
      attribute(:unit_name)      { string         object[:kurulus_adi]       }
      attribute(:unit_type_id)   { integer        object[:kurulus_turu]      }
      attribute(:unit_type_name) { string         object[:kurulus_turu_ad]   }
    end
  end
end
