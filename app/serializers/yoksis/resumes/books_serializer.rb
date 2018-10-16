# frozen_string_literal: true

module Yoksis
  module Resumes
    class BooksSerializer < Serializer
      attribute(:registry_id)              { integer        object[:y_id]              }
      attribute(:publishing_house)         { string         object[:yayin_evi]         }
      attribute(:publishing_language_id)   { integer        object[:yayin_dili]        }
      attribute(:publishing_language_name) { string         object[:yayin_dili_adi]    }
      attribute(:name)                     { integer        object[:kitap_adi]         }
      attribute(:type_id)                  { integer        object[:kitap_tur_id]      }
      attribute(:type_name)                { string         object[:kitap_tur]         }
      attribute(:scope_id)                 { integer        object[:kapsam_id]         }
      attribute(:scope_name)               { string         object[:kapsam_ad]         }
      attribute(:contribution_rate_id)     { integer        object[:katki_duzeyi]      }
      attribute(:contribution_rate_name)   { string         object[:katki_duzeyi_ad]   }
      attribute(:chapter_name)             { string         object[:bolum_adi]         }
      attribute(:number_of_author)         { integer        object[:yazar_sayisi]      }
      attribute(:authors)                  { split_string   object[:yazar_adi]         }
      attribute(:editor_name)              { string         object[:editor_adi]        }
      attribute(:country_id)               { integer        object[:ulke]              }
      attribute(:country_name)             { string         object[:ulke_adi]          }
      attribute(:city)                     { string         object[:sehir]             }
      attribute(:year)                     { integer        object[:yil]               }
      attribute(:isbn)                     { string         object[:isbn]              }
      attribute(:number_of_copy)           { integer        object[:kacinci_basim]     }
      attribute(:number_of_page)           { integer        object[:sayfa_sayisi]      }
      attribute(:chapter_first_page)       { integer        object[:bolum_ilk_sayfa]   }
      attribute(:chapter_last_page)        { integer        object[:bolum_son_sayfa]   }
      attribute(:releasing_type_id)        { integer        object[:basim_turu]        }
      attribute(:releasing_type_name)      { string         object[:basim_turu_ad]     }
      attribute(:access_link)              { string         object[:erisim_linki]      }
      attribute(:field)                    { string         object[:alan_bilgisi]      }
      attribute(:keywords)                 { split_string   object[:anahtar_kelime]    }
      attribute(:author_id)                { integer        object[:yazar_id]          }
      attribute(:number_of_citation)       { integer        object[:atif_sayisi]       }
      attribute(:active_or_passive_id)     { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name)   { string         object[:aktif_pasif_ad]    }
      attribute(:incentive_points)         { float          object[:tesv_puan]         }
      attribute(:date_of_update)           { parse_datetime object[:guncelleme_tarihi] }
    end
  end
end
