# frozen_string_literal: true

module Yoksis
  module Resumes
    class ThesisAdvisorsSerializer < Serializer
      attribute(:data_source)            { object[:verikaynak].titleize_tr                                           }
      attribute(:name)                   { object[:tez_adi].titleize_tr                                              }
      attribute(:type_id)                { object[:tur_id].safe_to_i                                                 }
      attribute(:type_name)              { object[:tur_adi].titleize_tr                                              }
      attribute(:place_id)               { object[:yer_id].safe_to_i                                                 }
      attribute(:place_name)             { object[:yer_adi].titleize_tr                                              }
      attribute(:country)                { object[:ulke].titleize_tr                                                 }
      attribute(:year)                   { object[:yil].safe_to_i                                                    }
      attribute(:registry_id)            { object[:kayit_id].safe_to_i                                               }
      attribute(:status)                 { object[:durum_adi].titleize_tr                                            }
      attribute(:author)                 { "#{object[:yazar_adi]} #{object[:yazar_soyadi]}".titleize_tr              }
      attribute(:university)             { object[:universite_ad].titleize_tr                                        }
      attribute(:major)                  { object[:abd_ad].titleize_tr                                               }
      attribute(:institution)            { object[:enstitu_ad].titleize_tr                                           }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
    end
  end
end
