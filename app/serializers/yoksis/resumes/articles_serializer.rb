# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArticlesSerializer < Serializer
      attribute(:id)                     { object[:yayin_id].try(:to_i)                }
      attribute(:name)                   { object[:makale_adi]                         }
      attribute(:type_id)                { object[:makale_turu_id].try(:to_i)          }
      attribute(:type_name)              { object[:makale_turu_ad]                     }
      attribute(:purview_id)             { object[:kapsam_id].try(:to_i)               }
      attribute(:purview_text)           { object[:kapsam_ad]                          }
      attribute(:referee_type_id)        { object[:hakem_tur].try(:to_i)               }
      attribute(:referee_type_text)      { object[:hakem_tur_ad]                       }
      attribute(:index_id)               { object[:endeks_id].try(:to_i)               }
      attribute(:index_text)             { object[:endeks]                             }
      attribute(:author_id)              { object[:yazar_adi].try(:to_i)               }
      attribute(:author_name)            { object[:yazar_adi]                          }
      attribute(:author_number)          { object[:yazar_sayisi].try(:to_i)            }
      attribute(:country_id)             { object[:ulke].try(:to_i)                    }
      attribute(:country_name)           { object[:ulke_adi]                           }
      attribute(:city)                   { object[:sehir]                              }
      attribute(:journal_name)           { object[:dergi_adi]                          }
      attribute(:language_id)            { object[:yayin_dili].try(:to_i)              }
      attribute(:language_name)          { object[:yayin_dili_adi]                     }
      attribute(:month)                  { object[:ay].try(:to_i)                      }
      attribute(:year)                   { object[:yil].try(:to_i)                     }
      attribute(:volume)                 { object[:cilt].try(:to_i)                    }
      attribute(:issue)                  { object[:sayi].try(:to_i)                    }
      attribute(:first_page)             { object[:ilk_sayfa].try(:to_i)               }
      attribute(:last_page)              { object[:son_sayfa].try(:to_i)               }
      attribute(:doi)                    { object[:doi].try(:to_i)                     }
      attribute(:issn)                   { object[:issn].try(:to_i)                    }
      attribute(:access_type_id)         { object[:erisim_turu].try(:to_i)             }
      attribute(:access_type_name)       { object[:erisim_turu_ad]                     }
      attribute(:access_link)            { object[:erisim_linki]                       }
      attribute(:citation_number)        { object[:atif_sayisi].try(:to_i)             }
      attribute(:field_information)      { object[:alan_bilgisi]                       }
      attribute(:keyword)                { object[:anahtar_kelime]                     }
      attribute(:special_id)             { object[:ozel_sayi].try(:to_i)               }
      attribute(:special_name)           { object[:ozel_sayi_ad]                       }
      attribute(:updated_at)             { Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].try(:to_i)             }
      attribute(:active_or_passive_text) { object[:aktif_pasif_ad]                     }
      attribute(:tesv_point)             { object[:tesv_puan].try(:to_f)               }
    end
  end
end
