# frozen_string_literal: true

module Yoksis
  module Resumes
    class CitationsSerializer < Serializer
      attribute(:id)              { object[:a_id].safe_to_i                          }
      attribute(:year)            { object[:donem].safe_to_i                         }
      attribute(:type_id)         { object[:tur].safe_to_i                           }
      attribute(:type_name)       { object[:tur_ad].titleize_tr                      }
      attribute(:work_type)       { object[:eser_turu].titleize_tr                   }
      attribute(:work_id)         { object[:eser_id].safe_to_i                       }
      attribute(:uluslar_kit_atf) { object[:uluslar_kit_atf].safe_to_i               }
      attribute(:ulusal_kit_atf)  { object[:ulusal_kit_atf].safe_to_i                }
      attribute(:ssci_index)      { object[:ssci_indeks_atf].safe_to_i               }
      attribute(:scope_index)     { object[:alan_indeks_atf].safe_to_i               }
      attribute(:other_citation)  { object[:diger_atif]                              }
      attribute(:incentive_point) { object[:tesv_puan].safe_to_f                     }
      attribute(:esci)            { object[:esci].safe_to_i                          }
      attribute(:besteci_eser)    { object[:besteci_eser]                            }
      attribute(:date_of_update)  { Time.zone.parse object[:guncelleme_tarihi] || '' }
    end
  end
end
