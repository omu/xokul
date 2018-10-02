# frozen_string_literal: true

module Yoksis
  module Resumes
    class PapersSerializer < Serializer
      attribute(:publishing_id)            { object[:yayin_id].safe_to_i                                                         }
      attribute(:publishing_language_id)   { object[:yayin_dili].safe_to_i                                                       }
      attribute(:publishing_language_name) { object[:yayin_dili_adi].titleize_tr                                                 }
      attribute(:publishing_status_id)     { object[:yayin_durumu].safe_to_i                                                     }
      attribute(:publishing_status_name)   { object[:yayin_durumu_ad].titleize_tr                                                }
      attribute(:presentation_type_id)     { object[:bildiri_sunum_turu].safe_to_i                                               }
      attribute(:presentation_type_name)   { object[:bildiri_sunum_turu_ad].titleize_tr                                          }
      attribute(:name)                     { object[:bildiri_adi]                                                                }
      attribute(:scope_id)                 { object[:kapsam_id].safe_to_i                                                        }
      attribute(:scope_name)               { object[:kapsam_ad]                                                                  }
      attribute(:type_id)                  { object[:bildiri_tur_id].safe_to_i                                                   }
      attribute(:type_name)                { object[:bildiri_tur].titleize_tr                                                    }
      attribute(:author_id)                { object[:yazar_id].safe_to_i                                                         }
      attribute(:number_of_author)         { object[:yazar_sayisi].safe_to_i                                                     }
      attribute(:authors)                  { object[:yazar_adi] && object[:yazar_adi].split(',').map(&:strip).map(&:titleize_tr) }
      attribute(:city)                     { object[:sehir].titleize_tr                                                          }
      attribute(:country_id)               { object[:ulke].safe_to_i                                                             }
      attribute(:country_name)             { object[:ulke_adi].titleize_tr                                                       }
      attribute(:date_of_release)          { object[:basim_tarihi] && Date.parse(object[:basim_tarihi])                          }
      attribute(:release_type_id)          { object[:basim_turu].safe_to_i                                                       }
      attribute(:release_type_name)        { object[:basim_turu_ad].titleize_tr                                                  }
      attribute(:volume)                   { object[:cilt].safe_to_i                                                             }
      attribute(:issue)                    { object[:sayi].safe_to_i                                                             }
      attribute(:first_page)               { object[:ilk_sayfa].safe_to_i                                                        }
      attribute(:last_page)                { object[:son_sayfa].safe_to_i                                                        }
      attribute(:doi)                      { object[:doi].safe_to_i                                                              }
      attribute(:issn)                     { object[:issn].safe_to_i                                                             }
      attribute(:print_isbn)               { object[:print_isbn].safe_to_i                                                       }
      attribute(:access_link)              { object[:access_link]                                                                }
      attribute(:number_of_citation)       { object[:atif_sayisi].safe_to_i                                                      }
      attribute(:field)                    { object[:alan_bilgisi].titleize_tr                                                   }
      attribute(:keywords)                 { object[:anahtar_kelime].titleize_tr                                                 }
      attribute(:special_edition_id)       { object[:ozel_sayi].safe_to_i                                                        }
      attribute(:special_edition_name)     { object[:ozel_sayi_ad].titleize_tr                                                   }
      attribute(:active_or_passive_id)     { object[:aktif_pasif].safe_to_i                                                      }
      attribute(:active_or_passive_name)   { object[:aktif_pasif_ad].titleize_tr                                                 }
      attribute(:incentive_points)         { object[:tesv_puan].safe_to_f                                                        }
      attribute(:date_of_update)           { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi])           }
    end
  end
end
