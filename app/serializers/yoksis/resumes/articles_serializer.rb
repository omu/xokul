# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArticlesSerializer < Serializer
      attribute(:publishing_id)            { object[:yayin_id].safe_to_i                                                         }
      attribute(:publishing_language_id)   { object[:yayin_dili].safe_to_i                                                       }
      attribute(:publishing_language_name) { object[:yayin_dili_adi].titleize_tr                                                 }
      attribute(:name)                     { object[:makale_adi].titleize_tr                                                     }
      attribute(:type_id)                  { object[:makale_turu_id].safe_to_i                                                   }
      attribute(:type_name)                { object[:makale_turu_ad].titleize_tr                                                 }
      attribute(:scope_id)                 { object[:kapsam_id].safe_to_i                                                        }
      attribute(:scope_name)               { object[:kapsam_ad].titleize_tr                                                      }
      attribute(:referee_type_id)          { object[:hakem_tur].safe_to_i                                                        }
      attribute(:referee_type_name)        { object[:hakem_tur_ad].titleize_tr                                                   }
      attribute(:index_id)                 { object[:endeks_id].safe_to_i                                                        }
      attribute(:index)                    { object[:endeks].titleize_tr                                                         }
      attribute(:author_id)                { object[:yazar_id].safe_to_i                                                         }
      attribute(:authors)                  { object[:yazar_adi] && object[:yazar_adi].split(',').map(&:strip).map(&:titleize_tr) }
      attribute(:number_of_author)         { object[:yazar_sayisi].safe_to_i                                                     }
      attribute(:country_id)               { object[:ulke].safe_to_i                                                             }
      attribute(:country_name)             { object[:ulke_adi].titleize_tr                                                       }
      attribute(:city)                     { object[:sehir].titleize_tr                                                          }
      attribute(:journal_name)             { object[:dergi_adi].titleize_tr                                                      }
      attribute(:month)                    { object[:ay].safe_to_i                                                               }
      attribute(:year)                     { object[:yil].safe_to_i                                                              }
      attribute(:volume)                   { object[:cilt].safe_to_i                                                             }
      attribute(:issue)                    { object[:sayi].safe_to_i                                                             }
      attribute(:first_page)               { object[:ilk_sayfa].safe_to_i                                                        }
      attribute(:last_page)                { object[:son_sayfa].safe_to_i                                                        }
      attribute(:doi)                      { object[:doi].safe_to_i                                                              }
      attribute(:issn)                     { object[:issn].safe_to_i                                                             }
      attribute(:access_type_id)           { object[:erisim_turu].safe_to_i                                                      }
      attribute(:access_type_name)         { object[:erisim_turu_ad]                                                             }
      attribute(:access_link)              { object[:erisim_linki]                                                               }
      attribute(:number_of_citation)       { object[:atif_sayisi].safe_to_i                                                      }
      attribute(:field)                    { object[:alan_bilgisi].titleize_tr                                                   }
      attribute(:keywords)                 { object[:anahtar_kelime].titleize_tr                                                 }
      attribute(:special_edition_id)       { object[:ozel_sayi].safe_to_i                                                        }
      attribute(:special_edition_name)     { object[:ozel_sayi_ad].titleize_tr                                                   }
      attribute(:date_of_update)           { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi])           }
      attribute(:active_or_passive_id)     { object[:aktif_pasif].safe_to_i                                                      }
      attribute(:active_or_passive_name)   { object[:aktif_pasif_ad].titleize_tr                                                 }
      attribute(:incentive_points)         { object[:tesv_puan].safe_to_f                                                        }
    end
  end
end
