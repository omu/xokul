# frozen_string_literal: true

module Yoksis
  module Resumes
    class LecturesSerializer < Serializer
      attribute(:lecture_id)             { object[:ders_id].safe_to_i                                                }
      attribute(:lecture_name)           { object[:ders_adi].titleize_tr                                             }
      attribute(:education_level_id)     { object[:ogrenim_id].safe_to_i                                             }
      attribute(:education_level_name)   { object[:ogrenim_adi].titleize_tr                                          }
      attribute(:academic_term_id)       { object[:akademik_yil_id].safe_to_i                                        }
      attribute(:academic_term)          { object[:akademik_yil]                                                     }
      attribute(:language_id)            { object[:dil_id].safe_to_i                                                 }
      attribute(:language_name)          { object[:dil_adi].titleize_tr                                              }
      attribute(:weekly_course_hours)    { object[:ders_saati].safe_to_i                                             }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:date_of_insert)         { object[:ekleme_tarihi] && Time.zone.parse(object[:ekleme_tarihi])         }
    end
  end
end
