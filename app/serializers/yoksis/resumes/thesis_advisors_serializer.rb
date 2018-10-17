# frozen_string_literal: true

module Yoksis
  module Resumes
    class ThesisAdvisorsSerializer < Serializer
      attribute(:activity_id)     { float          object[:aktif_pasif]                             }
      attribute(:activity_name)   { string         object[:aktif_pasif_ad]                          }
      attribute(:author)          { string         "#{object[:yazar_adi]} #{object[:yazar_soyadi]}" }
      attribute(:country)         { string         object[:ulke]                                    }
      attribute(:data_source)     { string         object[:verikaynak]                              }
      attribute(:last_update)     { parse_datetime object[:guncelleme_tarihi]                       }
      attribute(:location_id)     { integer        object[:yer_id]                                  }
      attribute(:location_name)   { string         object[:yer_adi]                                 }
      attribute(:major)           { string         object[:abd_ad]                                  }
      attribute(:name)            { string         object[:tez_adi]                                 }
      attribute(:status)          { string         object[:durum_adi]                               }
      attribute(:type_id)         { integer        object[:tur_id]                                  }
      attribute(:type_name)       { string         object[:tur_adi]                                 }
      attribute(:unit_name)       { string         object[:enstitu_ad]                              }
      attribute(:university_name) { string         object[:universite_ad]                           }
      attribute(:year)            { integer        object[:yil]                                     }
      attribute(:yoksis_id)       { integer        object[:kayit_id]                                }
    end
  end
end
