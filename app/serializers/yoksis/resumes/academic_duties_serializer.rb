# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicDutiesSerializer < Serializer
      attribute(:duty_id)                      { object[:gorev_id].safe_to_i                                               }
      attribute(:title_id)                     { object[:kadro_unvan_id].safe_to_i                                         }
      attribute(:title_name)                   { object[:kadro_unvan_adi].titleize_tr                                      }
      attribute(:place_id)                     { object[:yer_id].safe_to_i                                                 }
      attribute(:place_name)                   { object[:yer_ad].titleize_tr                                               }
      attribute(:country_id)                   { object[:ulke_id].safe_to_i                                                }
      attribute(:country_name)                 { object[:ulke_ad].titleize_tr                                              }
      attribute(:year_of_start)                { object[:bastar1].safe_to_i                                                }
      attribute(:year_of_end)                  { object[:bittar1].safe_to_i                                                }
      attribute(:scientific_field_name)        { object[:bilimalan_adi].titleize_tr                                        }
      attribute(:university_id)                { object[:univ_id].safe_to_i                                                }
      attribute(:university_name)              { object[:univ_birim_adi].titleize_tr                                       }
      attribute(:faculty)                      { object[:fakultebilgisi].titleize_tr                                       }
      attribute(:department)                   { object[:bolumbilgisi].titleize_tr                                         }
      attribute(:field)                        { object[:alanbilgisi].titleize_tr                                          }
      attribute(:field_of_specialization_id)   { object[:uzmanlik_alani].safe_to_i                                         }
      attribute(:field_of_specialization_name) { object[:uzmanlik_alani_ad].titleize_tr                                    }
      attribute(:unit_id)                      { object[:birim_id].safe_to_i                                               }
      attribute(:academic_status_id)           { object[:akademik_durum].safe_to_i                                         }
      attribute(:academic_status_name)         { object[:akademik_durum_adi].titleize_tr                                   }
      attribute(:academic_unit_name)           { object[:akademik_birim_adi].titleize_tr                                   }
      attribute(:active_or_passive_id)         { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name)       { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)               { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
