# frozen_string_literal: true

module Yoksis
  module Resumes
    class OtherExperiencesSerializer < Serializer
      attribute(:experience_id)          { object[:deneyim_id].titleize_tr                                           }
      attribute(:university_id)          { object[:kurulus_id].safe_to_i                                             }
      attribute(:university_name)        { object[:kurulus_adi].titleize_tr                                          }
      attribute(:duty_name)              { object[:gorev_adi].titleize_tr                                            }
      attribute(:year_of_start)          { object[:bas_tar].safe_to_i                                                }
      attribute(:year_of_end)            { object[:bit_tar].safe_to_i                                                }
      attribute(:job_description)        { object[:is_tanimi].titleize_tr                                            }
      attribute(:workplace_type_id)      { object[:isyeri_tur_id].safe_to_i                                          }
      attribute(:workplace_type_name)    { object[:isyeri_tur_ad].titleize_tr                                        }
      attribute(:position_type)          { object[:calisma_durumu].titleize_tr                                       }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
    end
  end
end
