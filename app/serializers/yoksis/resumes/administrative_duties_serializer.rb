# frozen_string_literal: true

module Yoksis
  module Resumes
    class AdministrativeDutiesSerializer < Serializer
      attribute(:activity_id)     { integer        object[:aktif_pasif]       }
      attribute(:activity_name)   { string         object[:aktif_pasif_ad]    }
      attribute(:country_id)      { integer        object[:ulke_id]           }
      attribute(:country_name)    { string         object[:ulke_adi]          }
      attribute(:department)      { string         object[:bolumbilgisi]      }
      attribute(:end_date)        { integer        object[:bit_tar]           }
      attribute(:faculty)         { string         object[:fakultemyoenst]    }
      attribute(:id)              { integer        object[:gorev_id]          }
      attribute(:last_update)     { parse_datetime object[:guncelleme_tarihi] }
      attribute(:location_id)     { integer        object[:yer_id]            }
      attribute(:location_name)   { string         object[:yer_ad]            }
      attribute(:major)           { string         object[:abd]               }
      attribute(:name)            { string         object[:gorev_adi]         }
      attribute(:start_date)      { integer        object[:bas_tar]           }
      attribute(:university_id)   { integer        object[:unv_id]            }
      attribute(:university_name) { string         object[:unv_birim_adi]     }
      attribute(:yoksis_id)       { integer        object[:idgor_id]          }
    end
  end
end
