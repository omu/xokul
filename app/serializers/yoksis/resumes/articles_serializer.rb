# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArticlesSerializer < Serializer
      attribute(:publishing_id)            { integer  object[:yayin_id]                            }
      attribute(:publishing_language_id)   { integer  object[:yayin_dili]                          }
      attribute(:publishing_language_name) { string   object[:yayin_dili_adi],   method: :titleize }
      attribute(:name)                     { string   object[:makale_adi],       method: :titleize }
      attribute(:type_id)                  { integer  object[:makale_turu_id]                      }
      attribute(:type_name)                { string   object[:makale_turu_ad],   method: :titleize }
      attribute(:scope_id)                 { integer  object[:kapsam_id]                           }
      attribute(:scope_name)               { string   object[:kapsam_ad],        method: :titleize }
      attribute(:referee_type_id)          { integer  object[:hakem_tur]                           }
      attribute(:referee_type_name)        { string   object[:hakem_tur_ad],     method: :titleize }
      attribute(:index_id)                 { integer  object[:endeks_id]                           }
      attribute(:index)                    { string   object[:endeks],           method: :titleize }
      attribute(:author_id)                { integer  object[:yazar_id]                            }
      attribute(:authors)                  { split    object[:yazar_adi],        separator: ','    }
      attribute(:number_of_author)         { integer  object[:yazar_sayisi]                        }
      attribute(:country_id)               { integer  object[:ulke]                                }
      attribute(:country_name)             { string   object[:ulke_adi],         method: :titleize }
      attribute(:city)                     { string   object[:sehir],            method: :titleize }
      attribute(:journal_name)             { string   object[:dergi_adi],        method: :titleize }
      attribute(:month)                    { integer  object[:ay]                                  }
      attribute(:year)                     { integer  object[:yil]                                 }
      attribute(:volume)                   { integer  object[:cilt]                                }
      attribute(:issue)                    { integer  object[:sayi]                                }
      attribute(:first_page)               { integer  object[:ilk_sayfa]                           }
      attribute(:last_page)                { integer  object[:son_sayfa]                           }
      attribute(:doi)                      { integer  object[:doi]                                 }
      attribute(:issn)                     { integer  object[:issn]                                }
      attribute(:access_type_id)           { integer  object[:erisim_turu]                         }
      attribute(:access_type_name)         { string   object[:erisim_turu_ad],   method: :titleize }
      attribute(:access_link)              { string   object[:erisim_linki]                        }
      attribute(:number_of_citation)       { integer  object[:atif_sayisi]                         }
      attribute(:field)                    { string   object[:alan_bilgisi],     method: :titleize }
      attribute(:keywords)                 { split    object[:anahtar_kelime],   separator: ','    }
      attribute(:special_edition_id)       { integer  object[:ozel_sayi]                           }
      attribute(:special_edition_name)     { string   object[:ozel_sayi_ad],     method: :titleize }
      attribute(:active_or_passive_id)     { integer  object[:aktif_pasif]                         }
      attribute(:active_or_passive_name)   { string   object[:aktif_pasif_ad],   method: :titleize }
      attribute(:incentive_points)         { float    object[:tesv_puan]                           }
      attribute(:date_of_update)           { datetime object[:guncelleme_tarihi]                   }
    end
  end
end
