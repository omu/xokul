# frozen_string_literal: true

module Yoksis
  module Resumes
    class PatentsSerializer < Serializer
      attribute(:id)                     { object[:patent_id].safe_to_i                                              }
      attribute(:name)                   { object[:patent_adi].titleize_tr                                           }
      attribute(:no)                     { object[:patent_no].safe_to_i                                              }
      attribute(:class)                  { object[:patent_sinif].upcase_tr                                           }
      attribute(:year)                   { object[:patent_tarihi].safe_to_i                                          }
      attribute(:applicants)             { object[:basvuru_sahipleri].upcase_tr                                      }
      attribute(:inventors)              { object[:bulus_sahipleri].upcase_tr                                        }
      attribute(:number_of_persons)      { object[:kisi_sayisi].safe_to_i                                            }
      attribute(:category_id)            { object[:kategori_id].safe_to_i                                            }
      attribute(:category_name)          { object[:kategori].titleize_tr                                             }
      attribute(:file_type_id)           { object[:dosya_tipi_id].safe_to_i                                          }
      attribute(:file_type_name)         { object[:dosya_tipi].titleize_tr                                           }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:scope_id)               { object[:kapsam_id].safe_to_i                                              }
      attribute(:scope_name)             { object[:kapsam].titleize_tr                                               }
      attribute(:title_id)               { object[:unvan_id].safe_to_i                                               }
      attribute(:title_name)             { object[:unvan_ad].titleize_tr                                             }
      attribute(:institution_id)         { object[:kurum_id].safe_to_i                                               }
      attribute(:institution_name)       { object[:kurum_ad].titleize_tr                                             }
      attribute(:incentive_points)       { object[:tesv_puan].safe_to_f                                              }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
