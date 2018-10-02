# frozen_string_literal: true

module Yoksis
  module Resumes
    class DesignsSerializer < Serializer
      attribute(:registry_id)            { object[:p_tasarim_id].safe_to_i                                                                     }
      attribute(:name)                   { object[:tasarim_adi].titleize_tr                                                                    }
      attribute(:summary)                { object[:tasarim_ozeti].titleize_tr                                                                  }
      attribute(:type_id)                { object[:tasarim_turu].safe_to_i                                                                     }
      attribute(:type_name)              { object[:tasarim_turu_adi].titleize_tr                                                               }
      attribute(:type_detail_id)         { object[:tasarim_turu_detay].safe_to_i                                                               }
      attribute(:type_detail_name)       { object[:tasarim_turu_detay_ad].titleize_tr                                                          }
      attribute(:date_of_start)          { object[:bas_tarihi] && Date.parse(object[:bas_tarihi])                                              }
      attribute(:date_of_end)            { object[:bitis_tarih] && Date.parse(object[:bitis_tarih])                                            }
      attribute(:scope_id)               { object[:kapsam].safe_to_i                                                                           }
      attribute(:scope_name)             { object[:kapsam_ad].titleize_tr                                                                      }
      attribute(:owners)                 { object[:tasarim_sahipleri] && object[:tasarim_sahipleri].split(',').map(&:strip).map(&:titleize_tr) }
      attribute(:title_id)               { object[:unvan_id].safe_to_i                                                                         }
      attribute(:title_name)             { object[:unvan_ad].titleize_tr                                                                       }
      attribute(:institution_id)         { object[:kurum_id].safe_to_i                                                                         }
      attribute(:institution_name)       { object[:kurum_ad].titleize_tr                                                                       }
      attribute(:number_of_person)       { object[:kisi_sayisi].safe_to_i                                                                      }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi])                           }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                                                      }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                                                 }
      attribute(:incentive_points)       { object[:tesv_puan].safe_to_f                                                                        }
    end
  end
end
