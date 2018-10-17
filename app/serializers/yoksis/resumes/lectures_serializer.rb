# frozen_string_literal: true

module Yoksis
  module Resumes
    class LecturesSerializer < Serializer
      attribute(:academic_term)        { integer        object[:akademik_yil]      }
      attribute(:academic_term_id)     { integer        object[:akademik_yil_id]   }
      attribute(:activity_id)          { integer        object[:aktif_pasif]       }
      attribute(:activity_name)        { string         object[:aktif_pasif_ad]    }
      attribute(:education_level_id)   { integer        object[:ogrenim_id]        }
      attribute(:education_level_name) { string         object[:ogrenim_adi]       }
      attribute(:id)                   { integer        object[:ders_id]           }
      attribute(:insert_date)          { parse_datetime object[:ekleme_tarihi]     }
      attribute(:language_id)          { integer        object[:dil_id]            }
      attribute(:language_name)        { string         object[:dil_adi]           }
      attribute(:last_update)          { parse_datetime object[:guncelleme_tarihi] }
      attribute(:name)                 { string         object[:ders_adi]          }
      attribute(:weekly_course_hours)  { integer        object[:ders_saati]        }
    end
  end
end
