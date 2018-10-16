# frozen_string_literal: true

module Yoksis
  module Resumes
    class PapersSerializer < Serializer
      attribute(:publishing_id)            { integer        object[:yayin_id]                             }
      attribute(:publishing_language_id)   { integer        object[:yayin_dili]                           }
      attribute(:publishing_language_name) { string         object[:yayin_dili_adi]                       }
      attribute(:publishing_status_id)     { integer        object[:yayin_durumu]                         }
      attribute(:publishing_status_name)   { string         object[:yayin_durumu_ad]                      }
      attribute(:presentation_type_id)     { integer        object[:bildiri_sunum_turu]                   }
      attribute(:presentation_type_name)   { string         object[:bildiri_sunum_turu_ad]                }
      attribute(:name)                     { string         object[:bildiri_adi]                          }
      attribute(:scope_id)                 { integer        object[:kapsam_id]                            }
      attribute(:scope_name)               { string         object[:kapsam_ad]                            }
      attribute(:type_id)                  { integer        object[:bildiri_tur_id]                       }
      attribute(:type_name)                { string         object[:bildiri_tur]                          }
      attribute(:author_id)                { integer        object[:yazar_id]                             }
      attribute(:number_of_author)         { integer        object[:yazar_sayisi]                         }
      attribute(:authors)                  { split_string   object[:yazar_adi]                            }
      attribute(:city)                     { string         object[:sehir]                                }
      attribute(:country_id)               { integer        object[:ulke]                                 }
      attribute(:country_name)             { string         object[:ulke_adi]                             }
      attribute(:date_of_release)          { parse_date     object[:basim_tarihi]                         }
      attribute(:release_type_id)          { integer        object[:basim_turu]                           }
      attribute(:release_type_name)        { string         object[:basim_turu_ad]                        }
      attribute(:volume)                   { integer        object[:cilt]                                 }
      attribute(:issue)                    { integer        object[:sayi]                                 }
      attribute(:first_page)               { integer        object[:ilk_sayfa]                            }
      attribute(:last_page)                { integer        object[:son_sayfa]                            }
      attribute(:doi)                      { integer        object[:doi]                                  }
      attribute(:issn)                     { integer        object[:issn]                                 }
      attribute(:print_isbn)               { integer        object[:print_isbn]                           }
      attribute(:access_link)              { string         object[:access_link], titleize_turkish: false }
      attribute(:number_of_citation)       { integer        object[:atif_sayisi]                          }
      attribute(:field)                    { string         object[:alan_bilgisi]                         }
      attribute(:keywords)                 { string         object[:anahtar_kelime]                       }
      attribute(:special_edition_id)       { integer        object[:ozel_sayi]                            }
      attribute(:special_edition_name)     { string         object[:ozel_sayi_ad]                         }
      attribute(:active_or_passive_id)     { integer        object[:aktif_pasif]                          }
      attribute(:active_or_passive_name)   { string         object[:aktif_pasif_ad]                       }
      attribute(:incentive_points)         { float          object[:tesv_puan]                            }
      attribute(:date_of_update)           { parse_datetime object[:guncelleme_tarihi]                    }
    end
  end
end
