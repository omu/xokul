# frozen_string_literal: true

module Yoksis
  module Resumes
    class CitationsSerializer < Serializer
      attribute(:registry_id)                 { integer        object[:a_id]                                  }
      attribute(:term)                        { integer        object[:donem]                                 }
      attribute(:type_id)                     { integer        object[:tur]                                   }
      attribute(:type_name)                   { string         object[:tur_ad]                                }
      attribute(:work_type)                   { string         object[:eser_turu]                             }
      attribute(:work_id)                     { integer        object[:eser_id]                               }
      attribute(:international_book_citation) { integer        object[:uluslar_kit_atf]                       }
      attribute(:national_book_citation)      { integer        object[:ulusal_kit_atf]                        }
      attribute(:ssci_index)                  { integer        object[:ssci_indeks_atf]                       }
      attribute(:scope_index)                 { integer        object[:alan_indeks_atf]                       }
      attribute(:other_citations)             { string         object[:diger_atif],   titleize_turkish: false }
      attribute(:incentive_points)            { float          object[:tesv_puan]                             }
      attribute(:esci)                        { integer        object[:esci]                                  }
      attribute(:composer_work)               { string         object[:besteci_eser], titleize_turkish: false }
      attribute(:date_of_update)              { parse_datetime object[:guncelleme_tarihi]                     }
    end
  end
end
