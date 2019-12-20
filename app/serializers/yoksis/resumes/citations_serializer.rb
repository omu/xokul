# frozen_string_literal: true

module Yoksis
  module Resumes
    class CitationsSerializer < Serializer
      attribute(:composer_work)               { string         object[:besteci_eser], case_conversion: false }
      attribute(:esci)                        { integer        object[:esci]                                 }
      attribute(:incentive_point)             { float          object[:tesv_puan]                            }
      attribute(:international_book_citation) { integer        object[:uluslar_kit_atf]                      }
      attribute(:last_update)                 { parse_datetime object[:guncelleme_tarihi]                    }
      attribute(:national_book_citation)      { integer        object[:ulusal_kit_atf]                       }
      attribute(:other_citations)             { string         object[:diger_atif], case_conversion: false }
      attribute(:scope_index)                 { integer        object[:alan_indeks_atf]                      }
      attribute(:ssci_index)                  { integer        object[:ssci_indeks_atf]                      }
      attribute(:term)                        { integer        object[:donem]                                }
      attribute(:type_id)                     { integer        object[:tur]                                  }
      attribute(:type_name)                   { string         object[:tur_ad]                               }
      attribute(:work_id)                     { integer        object[:eser_id]                              }
      attribute(:work_type)                   { string         object[:eser_turu]                            }
      attribute(:yoksis_id)                   { integer        object[:a_id]                                 }
    end
  end
end
