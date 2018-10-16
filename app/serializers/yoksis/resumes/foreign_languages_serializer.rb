# frozen_string_literal: true

module Yoksis
  module Resumes
    class ForeignLanguagesSerializer < Serializer
      attribute(:registry_id)            { integer        object[:y_id]                                     }
      attribute(:language_id)            { integer        object[:dil_id]                                   }
      attribute(:language_name)          { string         object[:dil_ad]                                   }
      attribute(:language_testing_id)    { integer        object[:dil_sinav_id]                             }
      attribute(:language_testing_name)  { string         object[:dil_sinav_ad], ->(p) { p.upcase :turkic } }
      attribute(:language_testing_point) { integer        object[:puan]                                     }
      attribute(:equivalent_point)       { integer        object[:esdegerpuan]                              }
      attribute(:year)                   { integer        object[:yil]                                      }
      attribute(:term_id)                { integer        object[:donem_id]                                 }
      attribute(:term_name)              { string         object[:donem_ad]                                 }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]                              }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]                           }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi]                        }
    end
  end
end
