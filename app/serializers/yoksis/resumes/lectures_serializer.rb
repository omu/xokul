# frozen_string_literal: true

module Yoksis
  module Resumes
    class LecturesSerializer < Serializer
      attribute(:lecture_id)             { integer        object[:ders_id]           }
      attribute(:lecture_name)           { string         object[:ders_adi]          }
      attribute(:education_level_id)     { integer        object[:ogrenim_id]        }
      attribute(:education_level_name)   { string         object[:ogrenim_adi]       }
      attribute(:academic_term_id)       { integer        object[:akademik_yil_id]   }
      attribute(:academic_term)          { integer        object[:akademik_yil]      }
      attribute(:language_id)            { integer        object[:dil_id]            }
      attribute(:language_name)          { string         object[:dil_adi]           }
      attribute(:weekly_course_hours)    { integer        object[:ders_saati]        }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }
      attribute(:date_of_insert)         { parse_datetime object[:ekleme_tarihi]     }
    end
  end
end
