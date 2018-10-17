# frozen_string_literal: true

module Yoksis
  module Resumes
    class BooksSerializer < Serializer
      attribute(:access_link)               { string         object[:erisim_linki], case_conversion: false }
      attribute(:activity_id)               { integer        object[:aktif_pasif]                          }
      attribute(:activity_name)             { string         object[:aktif_pasif_ad]                       }
      attribute(:author_id)                 { integer        object[:yazar_id]                             }
      attribute(:authors)                   { split_string   object[:yazar_adi]                            }
      attribute(:chapter_first_page)        { integer        object[:bolum_ilk_sayfa]                      }
      attribute(:chapter_last_page)         { integer        object[:bolum_son_sayfa]                      }
      attribute(:chapter_name)              { string         object[:bolum_adi]                            }
      attribute(:city)                      { string         object[:sehir]                                }
      attribute(:contribution_rate_id)      { integer        object[:katki_duzeyi]                         }
      attribute(:contribution_rate_name)    { string         object[:katki_duzeyi_ad]                      }
      attribute(:country_id)                { integer        object[:ulke]                                 }
      attribute(:country_name)              { string         object[:ulke_adi]                             }
      attribute(:discipline)                { string         object[:alan_bilgisi]                         }
      attribute(:editor_name)               { string         object[:editor_adi]                           }
      attribute(:incentive_point)           { float          object[:tesv_puan]                            }
      attribute(:isbn)                      { string         object[:isbn]                                 }
      attribute(:keywords)                  { split_string   object[:anahtar_kelime]                       }
      attribute(:last_update)               { parse_datetime object[:guncelleme_tarihi]                    }
      attribute(:name)                      { integer        object[:kitap_adi]                            }
      attribute(:number_of_authors)         { integer        object[:yazar_sayisi]                         }
      attribute(:number_of_citations)       { integer        object[:atif_sayisi]                          }
      attribute(:number_of_copy)            { integer        object[:kacinci_basim]                        }
      attribute(:number_of_page)            { integer        object[:sayfa_sayisi]                         }
      attribute(:publication_language_id)   { integer        object[:yayin_dili]                           }
      attribute(:publication_language_name) { string         object[:yayin_dili_adi]                       }
      attribute(:publisher)                 { string         object[:yayin_evi]                            }
      attribute(:scope_id)                  { integer        object[:kapsam_id]                            }
      attribute(:scope_name)                { string         object[:kapsam_ad]                            }
      attribute(:type_id)                   { integer        object[:kitap_tur_id]                         }
      attribute(:type_name)                 { string         object[:kitap_tur]                            }
      attribute(:type_of_release_id)        { integer        object[:basim_turu]                           }
      attribute(:type_of_release_name)      { string         object[:basim_turu_ad]                        }
      attribute(:year)                      { integer        object[:yil]                                  }
      attribute(:yoksis_id)                 { integer        object[:y_id]                                 }
    end
  end
end
