# frozen_string_literal: true

module Yoksis
  module Resumes
    class AdministrativeDutiesSerializer < Serializer
      attribute(:administrative_duty_id) { object[:idgor_id].safe_to_i                                               }
      attribute(:id)                     { object[:gorev_id].safe_to_i                                               }
      attribute(:name)                   { object[:gorev_adi].titleize_tr                                            }
      attribute(:place_id)               { object[:yer_id].safe_to_i                                                 }
      attribute(:place_name)             { object[:yer_ad].titleize_tr                                               }
      attribute(:country_id)             { object[:ulke_id].safe_to_i                                                }
      attribute(:country_name)           { object[:ulke_ad].titleize_tr                                              }
      attribute(:year_of_start)          { object[:bas_tar].safe_to_i                                                }
      attribute(:year_of_end)            { object[:bit_tar].safe_to_i                                                }
      attribute(:university_id)          { object[:unv_id].safe_to_i                                                 }
      attribute(:university_name)        { object[:unv_birim_adi].titleize_tr                                        }
      attribute(:institution)            { object[:fakultemyoenst].titleize_tr                                       }
      attribute(:major)                  { object[:abd].titleize_tr                                                  }
      attribute(:department)             { object[:bolumbilgisi].titleize_tr                                         }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
