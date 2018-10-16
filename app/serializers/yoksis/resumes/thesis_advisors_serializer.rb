# frozen_string_literal: true

module Yoksis
  module Resumes
    class ThesisAdvisorsSerializer < Serializer
      attribute(:data_source)            { string         object[:verikaynak]                              }
      attribute(:name)                   { string         object[:tez_adi]                                 }
      attribute(:type_id)                { integer        object[:tur_id]                                  }
      attribute(:type_name)              { string         object[:tur_adi]                                 }
      attribute(:place_id)               { integer        object[:yer_id]                                  }
      attribute(:place_name)             { string         object[:yer_adi]                                 }
      attribute(:country)                { string         object[:ulke]                                    }
      attribute(:year)                   { integer        object[:yil]                                     }
      attribute(:registry_id)            { integer        object[:kayit_id]                                }
      attribute(:status)                 { string         object[:durum_adi]                               }
      attribute(:author)                 { string         "#{object[:yazar_adi]} #{object[:yazar_soyadi]}" }
      attribute(:university)             { string         object[:universite_ad]                           }
      attribute(:major)                  { string         object[:abd_ad]                                  }
      attribute(:institution)            { string         object[:enstitu_ad]                              }
      attribute(:active_or_passive_id)   { float          object[:aktif_pasif]                             }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]                          }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi]                       }
    end
  end
end
