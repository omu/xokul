# frozen_string_literal: true

module Yoksis
  module Resumes
    class CitationsSerializer < Serializer
      attribute(:registry_id)                 { object[:a_id].safe_to_i                                                   }
      attribute(:term)                        { object[:donem].safe_to_i                                                  }
      attribute(:type_id)                     { object[:tur].safe_to_i                                                    }
      attribute(:type_name)                   { object[:tur_ad].titleize_tr                                               }
      attribute(:work_type)                   { object[:eser_turu].titleize_tr                                            }
      attribute(:work_id)                     { object[:eser_id].safe_to_i                                                }
      attribute(:international_book_citation) { object[:uluslar_kit_atf].safe_to_i                                        }
      attribute(:national_book_citation)      { object[:ulusal_kit_atf].safe_to_i                                         }
      attribute(:ssci_index)                  { object[:ssci_indeks_atf].safe_to_i                                        }
      attribute(:scope_index)                 { object[:alan_indeks_atf].safe_to_i                                        }
      attribute(:other_citations)             { object[:diger_atif]                                                       }
      attribute(:incentive_points)            { object[:tesv_puan].safe_to_f                                              }
      attribute(:esci)                        { object[:esci].safe_to_i                                                   }
      attribute(:composer_work)               { object[:besteci_eser]                                                     }
      attribute(:date_of_update)              { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
