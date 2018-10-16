# frozen_string_literal: true

module Yoksis
  module Resumes
    class OtherExperiencesSerializer < Serializer
      attribute(:experience_id)          { string         object[:deneyim_id]        }
      attribute(:university_id)          { integer        object[:kurulus_id]        }
      attribute(:university_name)        { string         object[:kurulus_adi]       }
      attribute(:duty_name)              { string         object[:gorev_adi]         }
      attribute(:year_of_start)          { integer        object[:bas_tar]           }
      attribute(:year_of_end)            { integer        object[:bit_tar]           }
      attribute(:job_description)        { string         object[:is_tanimi]         }
      attribute(:workplace_type_id)      { integer        object[:isyeri_tur_id]     }
      attribute(:workplace_type_name)    { string         object[:isyeri_tur_ad]     }
      attribute(:position_type)          { string         object[:calisma_durumu]    }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }
    end
  end
end
