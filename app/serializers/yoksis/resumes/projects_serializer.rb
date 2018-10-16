# frozen_string_literal: true

module Yoksis
  module Resumes
    class ProjectsSerializer < Serializer
      attribute(:project_id)             { integer        object[:proje_id]          }
      attribute(:name)                   { string         object[:proje_ad]          }
      attribute(:subject)                { string         object[:proje_konusu]      }
      attribute(:status_id)              { integer        object[:proje_durumu_id]   }
      attribute(:status_name)            { string         object[:proje_durumu_ad]   }
      attribute(:budget)                 { integer        object[:butce]             }
      attribute(:location_id)            { integer        object[:proje_konumu_id]   }
      attribute(:location_name)          { string         object[:proje_konumu_ad]   }
      attribute(:type_id)                { integer        object[:proje_turu_id]     }
      attribute(:type_name)              { string         object[:proje_turu_ad]     }
      attribute(:currency_id)            { integer        object[:para_birimi_id]    }
      attribute(:currency_name)          { string         object[:para_birimi_ad]    }
      attribute(:scope_id)               { integer        object[:kapsam]            }
      attribute(:scope_name)             { string         object[:kapsam_ad]         }
      attribute(:title_id)               { integer        object[:unvan_id]          }
      attribute(:title_name)             { string         object[:unvan_ad]          }
      attribute(:institution_id)         { integer        object[:kurum_id]          }
      attribute(:institution_name)       { string         object[:kurum_ad]          }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:incentive_points)       { float          object[:tesv_puan]         }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }

      attribute :date_of_start do
        next unless object[:bas_tar]

        year, month, day = object[:bas_tar].split('.').reverse
        build_date year, month, day
      end


      attribute :date_of_end do
        next unless object[:bit_tar]

        year, month, day = object[:bit_tar].split('.').reverse
        build_date year, month, day
      end
    end
  end
end
