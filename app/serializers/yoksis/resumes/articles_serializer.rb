# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArticlesSerializer < Serializer
      attribute(:id)                     { object[:yayin_id].safe_to_i                      }
      attribute(:name)                   { object[:makale_adi]                              }
      attribute(:type_id)                { object[:makale_turu_id].safe_to_i                }
      attribute(:type_name)              { object[:makale_turu_ad]                          }
      attribute(:purview_id)             { object[:kapsam_id].safe_to_i                     }
      attribute(:purview_text)           { object[:kapsam_ad]                               }
      attribute(:referee_type_id)        { object[:hakem_tur].safe_to_i                     }
      attribute(:referee_type_text)      { object[:hakem_tur_ad]                            }
      attribute(:index_id)               { object[:endeks_id].safe_to_i                     }
      attribute(:index_text)             { object[:endeks]                                  }
      attribute(:author_id)              { object[:yazar_adi].safe_to_i                     }
      attribute(:author_name)            { object[:yazar_adi]                               }
      attribute(:author_number)          { object[:yazar_sayisi].safe_to_i                  }
      attribute(:country_id)             { object[:ulke].safe_to_i                          }
      attribute(:country_name)           { object[:ulke_adi]                                }
      attribute(:city)                   { object[:sehir]                                   }
      attribute(:journal_name)           { object[:dergi_adi]                               }
      attribute(:language_id)            { object[:yayin_dili].safe_to_i                    }
      attribute(:language_name)          { object[:yayin_dili_adi]                          }
      attribute(:month)                  { object[:ay].safe_to_i                            }
      attribute(:year)                   { object[:yil].safe_to_i                           }
      attribute(:volume)                 { object[:cilt].safe_to_i                          }
      attribute(:issue)                  { object[:sayi].safe_to_i                          }
      attribute(:first_page)             { object[:ilk_sayfa].safe_to_i                     }
      attribute(:last_page)              { object[:son_sayfa].safe_to_i                     }
      attribute(:doi)                    { object[:doi].safe_to_i                           }
      attribute(:issn)                   { object[:issn].safe_to_i                          }
      attribute(:access_type_id)         { object[:erisim_turu].safe_to_i                   }
      attribute(:access_type_name)       { object[:erisim_turu_ad]                          }
      attribute(:access_link)            { object[:erisim_linki]                            }
      attribute(:citation_number)        { object[:atif_sayisi].safe_to_i                   }
      attribute(:field_information)      { object[:alan_bilgisi]                            }
      attribute(:keyword)                { object[:anahtar_kelime]                          }
      attribute(:special_id)             { object[:ozel_sayi].safe_to_i                     }
      attribute(:special_name)           { object[:ozel_sayi_ad]                            }
      attribute(:updated_at)             { Time.zone.parse object[:guncelleme_tarihi] || '' }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                   }
      attribute(:active_or_passive_text) { object[:aktif_pasif_ad]                          }
      attribute(:tesv_point)             { object[:tesv_puan].safe_to_f                     }
    end
  end
end
