# frozen_string_literal: true

module Yoksis
  module Resumes
    class EditorshipsSerializer < Serializer
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
      attribute(:editor_duty_id)            { integer        object[:editor_gorev]                         }
      attribute(:editor_duty_name)          { string         object[:editor_gorev_ad]                      }
      attribute(:end_date)                  { parse_date     object[:bit_tarih]                            }
      attribute(:incentive_point)           { float          object[:tesv_puan]                            }
      attribute(:index_id)                  { integer        object[:endeks_id]                            }
      attribute(:index_name)                { string         object[:endeks]                               }
      attribute(:issn)                      { string         object[:issn]                                 }
      attribute(:keywords)                  { split_string   object[:anahtar_kelime]                       }
      attribute(:last_update)               { parse_datetime object[:guncelleme_tarihi]                    }
      attribute(:number_of_authors)         { integer        object[:yazar_sayisi]                         }
      attribute(:number_of_citations)       { integer        object[:atif_sayisi]                          }
      attribute(:publication_id)            { integer        object[:yayin_id]                             }
      attribute(:publication_language_id)   { integer        object[:yayin_dili]                           }
      attribute(:publication_language_name) { string         object[:yayin_dili_adi]                       }
      attribute(:publication_name)          { string         object[:yayin_adi]                            }
      attribute(:publisher)                 { string         object[:yayin_evi]                            }
      attribute(:scope_id)                  { integer        object[:kapsam_id]                            }
      attribute(:scope_name)                { string         object[:kapsam_ad]                            }
      attribute(:start_date)                { parse_date     object[:bas_tarih]                            }
      attribute(:type_id)                   { integer        object[:editorluk_tur]                        }
      attribute(:type_name)                 { string         object[:editorluk_tur_ad]                     }
      attribute(:year)                      { integer        object[:yil]                                  }
    end
  end
end
