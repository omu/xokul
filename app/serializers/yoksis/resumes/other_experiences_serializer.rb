# frozen_string_literal: true

module Yoksis
  module Resumes
    class OtherExperiencesSerializer < Serializer
      attribute(:activity_id)         { integer        object[:aktif_pasif]       }
      attribute(:activity_name)       { string         object[:aktif_pasif_ad]    }
      attribute(:duty_name)           { string         object[:gorev_adi]         }
      attribute(:end_date)            { integer        object[:bit_tar]           }
      attribute(:id)                  { string         object[:deneyim_id]        }
      attribute(:job_description)     { string         object[:is_tanimi]         }
      attribute(:last_update)         { parse_datetime object[:guncelleme_tarihi] }
      attribute(:position_type)       { string         object[:calisma_durumu]    }
      attribute(:start_date)          { integer        object[:bas_tar]           }
      attribute(:unit_id)             { integer        object[:kurulus_id]        }
      attribute(:unit_name)           { string         object[:kurulus_adi]       }
      attribute(:workplace_type_id)   { integer        object[:isyeri_tur_id]     }
      attribute(:workplace_type_name) { string         object[:isyeri_tur_ad]     }
    end
  end
end
