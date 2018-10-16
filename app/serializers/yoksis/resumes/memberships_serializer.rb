# frozen_string_literal: true

module Yoksis
  module Resumes
    class MembershipsSerializer < Serializer
      attribute(:membership_id)          { integer        object[:uyelik_id]         }
      attribute(:membership_status_id)   { integer        object[:uyelik_durumu]     }
      attribute(:membership_status_name) { string         object[:uyelik_durumu_ad]  }
      attribute(:institution_name)       { string         object[:kurulus_adi]       }
      attribute(:institution_type_id)    { integer        object[:kurulus_turu]      }
      attribute(:institution_type_name)  { string         object[:kurulus_turu_ad]   }
      attribute(:year_of_start)          { integer        object[:bas_tar]           }
      attribute(:year_of_end)            { integer        object[:bit_tar]           }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }
    end
  end
end
