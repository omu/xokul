# frozen_string_literal: true

module Yoksis
  module Resumes
    class RefereeingSerializer < Serializer
      attribute(:publishing_id)            { object[:yayin_id].safe_to_i                                               }
      attribute(:publishing_place)         { object[:yayin_yeri].titleize_tr                                           }
      attribute(:publishing_language_id)   { object[:yayin_dili].safe_to_i                                             }
      attribute(:publishing_language_name) { object[:yayin_dili_adi].titleize_tr                                       }
      attribute(:type_id)                  { object[:hakemlik_turu].safe_to_i                                          }
      attribute(:type_name)                { object[:hakemlik_turu_ad].titleize_tr                                     }
      attribute(:number_of_refereeing)     { object[:hakemlik_sayisi].safe_to_i                                        }
      attribute(:scope_id)                 { object[:kapsam_id].safe_to_i                                              }
      attribute(:scope_name)               { object[:kapsam_ad].titleize_tr                                            }
      attribute(:country_id)               { object[:ulke].safe_to_i                                                   }
      attribute(:country_name)             { object[:ulke_adi].titleize_tr                                             }
      attribute(:city)                     { object[:sehir].titleize_tr                                                }
      attribute(:index_id)                 { object[:endeks_id].safe_to_i                                              }
      attribute(:index)                    { object[:endeks]                                                           }
      attribute(:year)                     { object[:yil].safe_to_i                                                    }
      attribute(:field)                    { object[:alan_bilgisi].titleize_tr                                         }
      attribute(:keywords)                 { object[:anahtar_kelime].titleize_tr                                       }
      attribute(:date_of_update)           { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)     { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name)   { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:incentive_points)         { object[:tesv_puan].safe_to_f                                              }
    end
  end
end
