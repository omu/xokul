# frozen_string_literal: true

module Yoksis
  module Resumes
    class ForeignLanguagesSerializer < Serializer
      attribute(:registry_id)            { object[:y_id].safe_to_i                                                   }
      attribute(:language_id)            { object[:dil_id].safe_to_i                                                 }
      attribute(:language_name)          { object[:dil_ad].titleize_tr                                               }
      attribute(:language_testing_id)    { object[:dil_sinav_id].safe_to_i                                           }
      attribute(:language_testing_name)  { object[:dil_sinav_ad].upcase_tr                                           }
      attribute(:language_testing_point) { object[:puan].safe_to_i                                                   }
      attribute(:equivalent_point)       { object[:esdegerpuan].safe_to_i                                            }
      attribute(:year)                   { object[:yil].safe_to_i                                                    }
      attribute(:term_id)                { object[:donem_id].safe_to_i                                               }
      attribute(:term_name)              { object[:donem_ad].titleize_tr                                             }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
