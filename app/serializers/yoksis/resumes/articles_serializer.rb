# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArticlesSerializer < Serializer
      attribute(:access_link)               { string         object[:erisim_linki], case_conversion: false }
      attribute(:access_type_id)            { integer        object[:erisim_turu]                          }
      attribute(:access_type_name)          { string         object[:erisim_turu_ad]                       }
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
      attribute(:index)                     { string         object[:endeks]                               }
      attribute(:index_id)                  { integer        object[:endeks_id]                            }
      attribute(:issn)                      { string         object[:issn]                                 }
      attribute(:issue)                     { integer        object[:sayi]                                 }
      attribute(:journal_name)              { string         object[:dergi_adi]                            }
      attribute(:keywords)                  { split_string   object[:anahtar_kelime]                       }
      attribute(:last_page)                 { integer        object[:son_sayfa]                            }
      attribute(:last_update)               { parse_datetime object[:guncelleme_tarihi]                    }
      attribute(:month)                     { integer        object[:ay]                                   }
      attribute(:name)                      { string         object[:makale_adi]                           }
      attribute(:number_of_authors)         { integer        object[:yazar_sayisi]                         }
      attribute(:number_of_citations)       { integer        object[:atif_sayisi]                          }
      attribute(:publication_id)            { integer        object[:yayin_id]                             }
      attribute(:publication_language_id)   { integer        object[:yayin_dili]                           }
      attribute(:publication_language_name) { string         object[:yayin_dili_adi]                       }
      attribute(:reviewer_id)               { integer        object[:hakem_tur]                            }
      attribute(:reviewer_name)             { string         object[:hakem_tur_ad]                         }
      attribute(:scope_id)                  { integer        object[:kapsam_id]                            }
      attribute(:scope_name)                { string         object[:kapsam_ad]                            }
      attribute(:special_issue_id)          { integer        object[:ozel_sayi]                            }
      attribute(:special_issue_name)        { string         object[:ozel_sayi_ad]                         }
      attribute(:sponsored_by)              { string         object[:sponsor]                              }
      attribute(:type_id)                   { integer        object[:makale_turu_id]                       }
      attribute(:type_name)                 { string         object[:makale_turu_ad]                       }
      attribute(:volume)                    { integer        object[:cilt]                                 }
      attribute(:year)                      { integer        object[:yil]                                  }
    end
  end
end
