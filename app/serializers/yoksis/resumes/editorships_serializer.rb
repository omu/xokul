# frozen_string_literal: true

module Yoksis
  module Resumes
    class EditorshipsSerializer < Serializer
      attribute(:publishing_id)            { integer        object[:yayin_id]                              }
      attribute(:publishing_name)          { string         object[:yayin_adi]                             }
      attribute(:publishing_house)         { string         object[:yayin_evi]                             }
      attribute(:publishing_language_id)   { integer        object[:yayin_dili]                            }
      attribute(:publishing_language_name) { string         object[:yayin_dili_adi]                        }
      attribute(:type_id)                  { integer        object[:editorluk_tur]                         }
      attribute(:type_name)                { string         object[:editorluk_tur_ad]                      }
      attribute(:scope_id)                 { integer        object[:kapsam_id]                             }
      attribute(:scope_name)               { string         object[:kapsam_ad]                             }
      attribute(:editor_duty_id)           { integer        object[:editor_gorev]                          }
      attribute(:editor_duty_name)         { string         object[:editor_gorev_ad]                       }
      attribute(:authors)                  { split_string   object[:yazar_adi]                             }
      attribute(:number_of_author)         { integer        object[:yazar_sayisi]                          }
      attribute(:country_id)               { integer        object[:ulke]                                  }
      attribute(:country_name)             { string         object[:ulke_adi]                              }
      attribute(:city)                     { string         object[:sehir]                                 }
      attribute(:index_id)                 { integer        object[:endeks_id]                             }
      attribute(:index)                    { string         object[:endeks]                                }
      attribute(:year)                     { integer        object[:yil]                                   }
      attribute(:date_of_start)            { parse_date     object[:bas_tarih]                             }
      attribute(:date_of_end)              { parse_date     object[:bit_tarih]                             }
      attribute(:doi)                      { integer        object[:doi]                                   }
      attribute(:issn)                     { integer        object[:issn]                                  }
      attribute(:access_type_id)           { integer        object[:erisim_turu]                           }
      attribute(:access_type_name)         { string         object[:erisim_turu_ad]                        }
      attribute(:access_link)              { string         object[:erisim_linki], titleize_turkish: false }
      attribute(:citations_number)         { integer        object[:atif_sayisi]                           }
      attribute(:field)                    { string         object[:alan_bilgisi]                          }
      attribute(:keywords)                 { string         object[:anahtar_kelime]                        }
      attribute(:author_id)                { integer        object[:yazar_id]                              }
      attribute(:active_or_passive_id)     { integer        object[:aktif_pasif]                           }
      attribute(:active_or_passive_name)   { string         object[:aktif_pasif_ad]                        }
      attribute(:incentive_points)         { float          object[:tesv_puan]                             }
      attribute(:date_of_update)           { parse_datetime object[:guncelleme_tarihi]                     }
    end
  end
end
