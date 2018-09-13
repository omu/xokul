# frozen_string_literal: true

module Yoksis
  module Resumes
    class ProjectsSerializer < Serializer
      attribute(:id)                     { object[:proje_id].safe_to_i                      }
      attribute(:name)                   { object[:proje_ad]                                }
      attribute(:subject)                { object[:proje_konusu]                            }
      attribute(:status_id)              { object[:proje_durumu_id].safe_to_i               }
      attribute(:status_text)            { object[:proje_durumu_ad]                         }
      attribute(:updated_at)             { Time.zone.parse object[:guncelleme_tarihi] || '' }
      attribute(:budget)                 { object[:butce].safe_to_i                         }
      attribute(:location_id)            { object[:proje_konumu_id].safe_to_i               }
      attribute(:location_text)          { object[:proje_konumu_ad]                         }
      attribute(:type_id)                { object[:proje_turu_id].safe_to_i                 }
      attribute(:type_text)              { object[:proje_turu_ad]                           }
      attribute(:currency_id)            { object[:para_birimi_id].safe_to_i                }
      attribute(:currency_text)          { object[:para_birimi_ad]                          }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                   }
      attribute(:active_or_passive_text) { object[:aktif_pasif_ad]                          }
      attribute(:purview_id)             { object[:kapsam].safe_to_i                        }
      attribute(:purview_text)           { object[:kapsam_ad]                               }
      attribute(:academic_title_id)      { object[:unvan_id].safe_to_i                      }
      attribute(:academic_title_text)    { object[:unvan_ad]                                }
      attribute(:university_id)          { object[:kurum_id].safe_to_i                      }
      attribute(:university_name)        { object[:kurum_ad]                                }
      attribute(:tesv_point)             { object[:tesv_puan].safe_to_f                     }

      attribute :started_at do
        next unless object[:bas_tar]
        build_date(*object[:bas_tar].split('.').reverse.collect(&:safe_to_i))
      end


      attribute :ended_at do
        next unless object[:bit_tar]
        build_date(*object[:bit_tar].split('.').reverse.collect(&:safe_to_i))
      end
    end
  end
end
