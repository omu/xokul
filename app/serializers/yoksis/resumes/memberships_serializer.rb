# frozen_string_literal: true

module Yoksis
  module Resumes
    class MembershipsSerializer < Serializer
      attribute(:membership_id)          { object[:uyelik_id].safe_to_i                                              }
      attribute(:membership_status_id)   { object[:uyelik_durumu].safe_to_i                                          }
      attribute(:membership_status_name) { object[:uyelik_durumu_ad].titleize_tr                                     }
      attribute(:institution_name)       { object[:kurulus_adi].titleize_tr                                          }
      attribute(:institution_type_id)    { object[:kurulus_turu].safe_to_i                                           }
      attribute(:institution_type_name)  { object[:kurulus_turu_ad].titleize_tr                                      }
      attribute(:year_of_start)          { object[:bas_tar].safe_to_i                                                }
      attribute(:year_of_end)            { object[:bit_tar].safe_to_i                                                }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
