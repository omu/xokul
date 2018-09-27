# frozen_string_literal: true

module Yoksis
  module Resumes
    class EducationInformationsSerializer < Serializer
      attribute(:registry_id)                   { object[:id].safe_to_i                                                     }
      attribute(:place_id)                      { object[:yer_id].safe_to_i                                                 }
      attribute(:place_name)                    { object[:yer_ad].titleize_tr                                               }
      attribute(:year_of_start)                 { object[:bastar1].safe_to_i                                                }
      attribute(:year_of_end)                   { object[:bittar1].safe_to_i                                                }
      attribute(:country_id)                    { object[:ulke_id].safe_to_i                                                }
      attribute(:country_name)                  { object[:ulke_ad].titleize_tr                                              }
      attribute(:other_field)                   { object[:diger_alan].titleize_tr                                           }
      attribute(:yok_unit_id)                   { object[:birim_yok].safe_to_i                                              }
      attribute(:program_id)                    { object[:program_id].safe_to_i                                             }
      attribute(:program_name)                  { object[:program_adi].titleize_tr                                          }
      attribute(:other_university)              { object[:diger_universite].titleize_tr                                     }
      attribute(:thesis_name)                   { object[:tez_adi].titleize_tr                                              }
      attribute(:thesis_step_id)                { object[:tez_asamasi].safe_to_i                                            }
      attribute(:thesis_step_name)              { object[:tez_asamasi_ad].titleize_tr                                       }
      attribute(:start_date_of_thesis)          { object[:tez_bas_tar].safe_to_i                                            }
      attribute(:end_date_of_thesis)            { object[:tez_bit_tar].safe_to_i                                            }
      attribute(:university_id)                 { object[:univ_id].safe_to_i                                                }
      attribute(:university_name)               { object[:unv_birim_adi].titleize_tr                                        }
      attribute(:academic_unit_id)              { object[:akademik_birim_id].safe_to_i                                      }
      attribute(:academic_unit_name)            { object[:akademik_birim_adi].titleize_tr                                   }
      attribute(:faculty)                       { object[:fakultebilgisi].titleize_tr                                       }
      attribute(:department)                    { object[:bolumbilgisi].titleize_tr                                         }
      attribute(:field)                         { object[:alanbilgisi].titleize_tr                                          }
      attribute(:diploma_no)                    { object[:diploma_no].safe_to_i                                             }
      attribute(:number_of_diploma_equivalency) { object[:diplomadenklik_tarih_sayi].safe_to_i                              }
      attribute(:advisors_id_number)            { object[:danisman_tc].safe_to_i                                            }
      attribute(:advisor)                       { object[:danisman_ad_soyad].titleize_tr                                    }
      attribute(:c_unit_id)                     { object[:c_birim_id].safe_to_i                                             }
      attribute(:c_unit_name)                   { object[:c_birim_ad].safe_to_i                                             }
      attribute(:date_of_update)                { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)          { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name)        { object[:aktif_pasif_ad].titleize_tr                                       }
    end
  end
end
