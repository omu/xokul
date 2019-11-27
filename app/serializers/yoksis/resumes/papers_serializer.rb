# frozen_string_literal: true

module Yoksis
  module Resumes
    class PapersSerializer < Serializer
      attribute(:access_link)               { string         object[:erisim_linki], case_conversion: false }
      attribute(:activity_id)               { integer        object[:aktif_pasif]                          }
      attribute(:activity_name)             { string         object[:aktif_pasif_ad]                       }
      attribute(:author_id)                 { integer        object[:yazar_id]                             }
      attribute(:authors)                   { split_string   object[:yazar_adi]                            }
      attribute(:city)                      { string         object[:sehir]                                }
      attribute(:country_id)                { integer        object[:ulke]                                 }
      attribute(:country_name)              { string         object[:ulke_adi]                             }
      attribute(:discipline)                { string         object[:alan_bilgisi]                         }
      attribute(:doi)                       { string         object[:doi]                                  }
      attribute(:first_page)                { integer        object[:ilk_sayfa]                            }
      attribute(:incentive_point)           { float          object[:tesv_puan]                            }
      attribute(:issn)                      { string         object[:issn]                                 }
      attribute(:issue)                     { integer        object[:sayi]                                 }
      attribute(:keywords)                  { split_string   object[:anahtar_kelime]                       }
      attribute(:last_page)                 { integer        object[:son_sayfa]                            }
      attribute(:last_update)               { parse_datetime object[:guncelleme_tarihi]                    }
      attribute(:name)                      { string         object[:bildiri_adi]                          }
      attribute(:number_of_authors)         { integer        object[:yazar_sayisi]                         }
      attribute(:number_of_citations)       { integer        object[:atif_sayisi]                          }
      attribute(:presentation_type_id)      { integer        object[:bildiri_sunum_turu]                   }
      attribute(:presentation_type_name)    { string         object[:bildiri_sunum_turu_ad]                }
      attribute(:print_isbn)                { string         object[:print_isbn]                           }
      attribute(:publication_id)            { integer        object[:yayin_id]                             }
      attribute(:publication_language_id)   { integer        object[:yayin_dili]                           }
      attribute(:publication_language_name) { string         object[:yayin_dili_adi]                       }
      attribute(:publication_status_id)     { integer        object[:yayin_durumu]                         }
      attribute(:publication_status_name)   { string         object[:yayin_durumu_ad]                      }
      attribute(:release_date)              { parse_date     object[:basim_tarihi]                         }
      attribute(:scope_id)                  { integer        object[:kapsam_id]                            }
      attribute(:scope_name)                { string         object[:kapsam_ad]                            }
      attribute(:special_issue_id)          { integer        object[:ozel_sayi]                            }
      attribute(:special_issue_name)        { string         object[:ozel_sayi_ad]                         }
      attribute(:sponsored_by)              { string         object[:sponsor]                              }
      attribute(:type_id)                   { integer        object[:bildiri_tur_id]                       }
      attribute(:type_name)                 { string         object[:bildiri_tur]                          }
      attribute(:type_of_release_id)        { integer        object[:basim_turu]                           }
      attribute(:type_of_release_name)      { string         object[:basim_turu_ad]                        }
      attribute(:volume)                    { integer        object[:cilt]                                 }
    end
  end
end
