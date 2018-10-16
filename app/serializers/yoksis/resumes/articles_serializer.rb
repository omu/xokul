# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArticlesSerializer < Serializer
      attribute(:publishing_id)            { integer        object[:yayin_id]                              }
      attribute(:publishing_language_id)   { integer        object[:yayin_dili]                            }
      attribute(:publishing_language_name) { string         object[:yayin_dili_adi]                        }
      attribute(:name)                     { string         object[:makale_adi]                            }
      attribute(:type_id)                  { integer        object[:makale_turu_id]                        }
      attribute(:type_name)                { string         object[:makale_turu_ad]                        }
      attribute(:scope_id)                 { integer        object[:kapsam_id]                             }
      attribute(:scope_name)               { string         object[:kapsam_ad]                             }
      attribute(:referee_type_id)          { integer        object[:hakem_tur]                             }
      attribute(:referee_type_name)        { string         object[:hakem_tur_ad]                          }
      attribute(:index_id)                 { integer        object[:endeks_id]                             }
      attribute(:index)                    { string         object[:endeks]                                }
      attribute(:author_id)                { integer        object[:yazar_id]                              }
      attribute(:authors)                  { split_string   object[:yazar_adi]                             }
      attribute(:number_of_author)         { integer        object[:yazar_sayisi]                          }
      attribute(:country_id)               { integer        object[:ulke]                                  }
      attribute(:country_name)             { string         object[:ulke_adi]                              }
      attribute(:city)                     { string         object[:sehir]                                 }
      attribute(:journal_name)             { string         object[:dergi_adi]                             }
      attribute(:month)                    { integer        object[:ay]                                    }
      attribute(:year)                     { integer        object[:yil]                                   }
      attribute(:volume)                   { integer        object[:cilt]                                  }
      attribute(:issue)                    { integer        object[:sayi]                                  }
      attribute(:first_page)               { integer        object[:ilk_sayfa]                             }
      attribute(:last_page)                { integer        object[:son_sayfa]                             }
      attribute(:doi)                      { integer        object[:doi]                                   }
      attribute(:issn)                     { integer        object[:issn]                                  }
      attribute(:access_type_id)           { integer        object[:erisim_turu]                           }
      attribute(:access_type_name)         { string         object[:erisim_turu_ad]                        }
      attribute(:access_link)              { string         object[:erisim_linki], titleize_turkish: false }
      attribute(:number_of_citation)       { integer        object[:atif_sayisi]                           }
      attribute(:field)                    { string         object[:alan_bilgisi]                          }
      attribute(:keywords)                 { split_string   object[:anahtar_kelime]                        }
      attribute(:special_edition_id)       { integer        object[:ozel_sayi]                             }
      attribute(:special_edition_name)     { string         object[:ozel_sayi_ad]                          }
      attribute(:active_or_passive_id)     { integer        object[:aktif_pasif]                           }
      attribute(:active_or_passive_name)   { string         object[:aktif_pasif_ad]                        }
      attribute(:incentive_points)         { float          object[:tesv_puan]                             }
      attribute(:date_of_update)           { parse_datetime object[:guncelleme_tarihi]                     }
    end
  end
end
