# frozen_string_literal: true

module Yoksis
  module Resumes
    class ArtisticActivitiesSerializer < Serializer
      attribute(:registry_id)            { object[:s_id].safe_to_i                                            }
      attribute(:name)                   { object[:etkinlik_adi].titleize_tr                                  }
      attribute(:place)                  { object[:etkinlik_yeri].titleize_tr                                 }
      attribute(:type_id)                { object[:etkinlik_turu].safe_to_i                                   }
      attribute(:type_name)              { object[:etkinlik_turu_ad].titleize_tr                              }
      attribute(:duration)               { object[:etkinlik_suresi].safe_to_i                                 }
      attribute(:scope_id)               { object[:kapsam].safe_to_i                                          }
      attribute(:scope_name)             { object[:kapsam_ad].titleize_tr                                     }
      attribute(:language_id)            { object[:etkinlik_dili].safe_to_i                                   }
      attribute(:language_name)          { object[:dil_adi].titleize_tr                                       }
      attribute(:date_of_start)          { object[:bas_tarih] && Date.parse(object[:bas_tarih])               }
      attribute(:date_of_end)            { object[:bit_tarih] && Date.parse(object[:bit_tarih])               }
      attribute(:organizers)             { object[:duzenleyenler].titleize_tr                                 }
      attribute(:number_of_person)       { object[:kisi_sayisi].safe_to_i                                     }
      attribute(:country_id)             { object[:ulke].safe_to_i                                            }
      attribute(:country_name)           { object[:ulke_adi].titleize_tr                                      }
      attribute(:city)                   { object[:sehir].titleize_tr                                         }
      attribute(:title_id)               { object[:unvan_id].safe_to_i                                        }
      attribute(:title_name)             { object[:unvan_ad].titleize_tr                                      }
      attribute(:institution_id)         { object[:kurum_id].safe_to_i                                        }
      attribute(:institution_name)       { object[:kurum_ad].titleize_tr                                      }
      attribute(:work_type_id)           { object[:tip].safe_to_i                                             }
      attribute(:work_type_name)         { object[:tip_adi].titleize_tr                                       }
      attribute(:main_type_id)           { object[:ana_tur].safe_to_i                                         }
      attribute(:main_type_name)         { object[:anatur_adi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                     }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                }
      attribute(:incentive_points)       { object[:tesv_puan].safe_to_f                                       }
    end
  end
end
