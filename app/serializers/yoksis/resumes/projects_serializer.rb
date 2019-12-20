# frozen_string_literal: true

module Yoksis
  module Resumes
    class ProjectsSerializer < Serializer
      attribute(:activity_id)     { integer        object[:aktif_pasif]       }
      attribute(:activity_name)   { string         object[:aktif_pasif_ad]    }
      attribute(:budget)          { integer        object[:butce]             }
      attribute(:currency_id)     { integer        object[:para_birimi_id]    }
      attribute(:currency_name)   { string         object[:para_birimi_ad]    }
      attribute(:id)              { integer        object[:proje_id]          }
      attribute(:incentive_point) { float          object[:tesv_puan]         }
      attribute(:last_update)     { parse_datetime object[:guncelleme_tarihi] }
      attribute(:location_id)     { integer        object[:proje_konumu_id]   }
      attribute(:location_name)   { string         object[:proje_konumu_ad]   }
      attribute(:name)            { string         object[:proje_ad]          }
      attribute(:scope_id)        { integer        object[:kapsam]            }
      attribute(:scope_name)      { string         object[:kapsam_ad]         }
      attribute(:status_id)       { integer        object[:proje_durumu_id]   }
      attribute(:status_name)     { string         object[:proje_durumu_ad]   }
      attribute(:subject)         { string         object[:proje_konusu]      }
      attribute(:title_id)        { integer        object[:unvan_id]          }
      attribute(:title_name)      { string         object[:unvan_ad]          }
      attribute(:type_id)         { integer        object[:proje_turu_id]     }
      attribute(:type_name)       { string         object[:proje_turu_ad]     }
      attribute(:unit_id)         { integer        object[:kurum_id]          }
      attribute(:unit_name)       { string         object[:kurum_ad]          }

      attribute :start_date do
        next unless object[:bas_tar]

        year, month, day = object[:bas_tar].split('.').reverse
        build_date year, month, day
      end

      attribute :end_date do
        next unless object[:bit_tar]

        year, month, day = object[:bit_tar].split('.').reverse
        build_date year, month, day
      end
    end
  end
end
