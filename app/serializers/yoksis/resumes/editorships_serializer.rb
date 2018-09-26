# frozen_string_literal: true

module Yoksis
  module Resumes
    class EditorshipsSerializer < Serializer
      attribute(:publishing_id)            { object[:yayin_id].safe_to_i                                                         }
      attribute(:publishing_name)          { object[:yayin_adi].titleize_tr                                                      }
      attribute(:publishing_house)         { object[:yayin_evi].titleize_tr                                                      }
      attribute(:publishing_language_id)   { object[:yayin_dili].safe_to_i                                                       }
      attribute(:publishing_language_name) { object[:yayin_dili_adi].titleize_tr                                                 }
      attribute(:type_id)                  { object[:editorluk_tur].safe_to_i                                                    }
      attribute(:type_name)                { object[:editorluk_tur_ad].titleize_tr                                               }
      attribute(:scope_id)                 { object[:kapsam_id].safe_to_i                                                        }
      attribute(:scope_name)               { object[:kapsam_ad].titleize_tr                                                      }
      attribute(:duty_id)                  { object[:editor_gorev].safe_to_i                                                     }
      attribute(:duty_name)                { object[:editor_gorev_ad].titleize_tr                                                }
      attribute(:authors)                  { object[:yazar_adi] && object[:yazar_adi].split(',').map(&:strip).map(&:titleize_tr) }
      attribute(:authors_number)           { object[:yazar_sayisi].safe_to_i                                                     }
      attribute(:country_id)               { object[:ulke].safe_to_i                                                             }
      attribute(:country_name)             { object[:ulke_adi].titleize_tr                                                       }
      attribute(:city)                     { object[:sehir].titleize_tr                                                          }
      attribute(:index_id)                 { object[:endeks_id].safe_to_i                                                        }
      attribute(:index)                    { object[:endeks]                                                                     }
      attribute(:year)                     { object[:yil].safe_to_i                                                              }
      attribute(:date_of_start)            { object[:bas_tarih] && Date.parse(object[:bas_tarih])                                }
      attribute(:date_of_end)              { object[:bit_tarih] && Date.parse(object[:bit_tarih])                                }
      attribute(:doi)                      { object[:doi].safe_to_i                                                              }
      attribute(:issn)                     { object[:issn].safe_to_i                                                             }
      attribute(:access_type_id)           { object[:erisim_turu].safe_to_i                                                      }
      attribute(:access_type_name)         { object[:erisim_turu_ad].titleize_tr                                                 }
      attribute(:access_link)              { object[:erisim_linki]                                                               }
      attribute(:citations_number)         { object[:atif_sayisi].safe_to_i                                                      }
      attribute(:field)                    { object[:alan_bilgisi].titleize_tr                                                   }
      attribute(:keywords)                 { object[:anahtar_kelime].titleize_tr                                                 }
      attribute(:author_id)                { object[:yazar_id].safe_to_i                                                         }
      attribute(:date_of_update)           { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi])           }
      attribute(:active_or_passive_id)     { object[:aktif_pasif].safe_to_i                                                      }
      attribute(:active_or_passive_name)   { object[:aktif_pasif_ad].titleize_tr                                                 }
      attribute(:incentive_points)         { object[:tesv_puan].safe_to_f                                                        }
    end
  end
end
