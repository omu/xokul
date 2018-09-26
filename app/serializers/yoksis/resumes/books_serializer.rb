# frozen_string_literal: true

module Yoksis
  module Resumes
    class BooksSerializer < Serializer
      attribute(:publishing_id)            { object[:y_id].safe_to_i                                                   }
      attribute(:publishing_house)         { object[:yayin_evi].titleize_tr                                            }
      attribute(:publishing_language_id)   { object[:yayin_dili].safe_to_i                                             }
      attribute(:publishing_language_name) { object[:yayin_dili_adi].titleize_tr                                       }
      attribute(:scope_id)                 { object[:kapsam_id].safe_to_i                                              }
      attribute(:scope_name)               { object[:kapsam_ad].titleize_tr                                            }
      attribute(:name)                     { object[:kitap_adi].safe_to_i                                              }
      attribute(:type_id)                  { object[:kitap_tur_id].safe_to_i                                           }
      attribute(:type_name)                { object[:kitap_tur].titleize_tr                                            }
      attribute(:contribution_rate_id)     { object[:katki_duzeyi].safe_to_i                                           }
      attribute(:contribution_rate_name)   { object[:katki_duzeyi_ad].titleize_tr                                      }
      attribute(:chapter_name)             { object[:bolum_adi].titleize_tr                                            }
      attribute(:authors_number)           { object[:yazar_sayisi].safe_to_i                                           }
      attribute(:author_name)              { object[:yazar_adi].titleize_tr                                            }
      attribute(:editor_name)              { object[:editor_adi].titleize_tr                                           }
      attribute(:country_id)               { object[:ulke].safe_to_i                                                   }
      attribute(:country_name)             { object[:ulke_adi].titleize_tr                                             }
      attribute(:city)                     { object[:sehir].titleize_tr                                                }
      attribute(:year)                     { object[:yil].safe_to_i                                                    }
      attribute(:isbn)                     { object[:isbn].titleize_tr                                                 }
      attribute(:copies_number)            { object[:kacinci_basim].safe_to_i                                          }
      attribute(:pages_number)             { object[:sayfa_sayisi].safe_to_i                                           }
      attribute(:chapter_first_page)       { object[:bolum_ilk_sayfa].safe_to_i                                        }
      attribute(:chapter_last_page)        { object[:bolum_son_sayfa].safe_to_i                                        }
      attribute(:releasing_type_id)        { object[:basim_turu].safe_to_i                                             }
      attribute(:releasing_type_name)      { object[:basim_turu_ad].titleize_tr                                        }
      attribute(:access_link)              { object[:erisim_linki]                                                     }
      attribute(:field)                    { object[:alan_bilgisi].titleize_tr                                         }
      attribute(:keywords)                 { object[:anahtar_kelime].titleize_tr                                       }
      attribute(:author_id)                { object[:yazar_id].safe_to_i                                               }
      attribute(:citations_number)         { object[:atif_sayisi].safe_to_i                                            }
      attribute(:active_or_passive_id)     { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name)   { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)           { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:incentive_points)         { object[:tesv_puan].safe_to_f                                              }
    end
  end
end
