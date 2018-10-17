# frozen_string_literal: true

module Yoksis
  module Resumes
    class ForeignLanguagesSerializer < Serializer
      attribute(:activity_id)         { integer        object[:aktif_pasif]                              }
      attribute(:activity_name)       { string         object[:aktif_pasif_ad]                           }
      attribute(:equivalent_point)    { integer        object[:esdegerpuan]                              }
      attribute(:language_exam_id)    { integer        object[:dil_sinav_id]                             }
      attribute(:language_exam_name)  { string         object[:dil_sinav_ad], ->(p) { p.upcase :turkic } }
      attribute(:language_id)         { integer        object[:dil_id]                                   }
      attribute(:language_name)       { string         object[:dil_ad]                                   }
      attribute(:last_update)         { parse_datetime object[:guncelleme_tarihi]                        }
      attribute(:point)               { integer        object[:puan]                                     }
      attribute(:term_id)             { integer        object[:donem_id]                                 }
      attribute(:term_name)           { string         object[:donem_ad]                                 }
      attribute(:year)                { integer        object[:yil]                                      }
      attribute(:yoksis_id)           { integer        object[:y_id]                                     }
    end
  end
end
