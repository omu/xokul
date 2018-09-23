# frozen_string_literal: true

module Yoksis
  module Resumes
    class ProjectsSerializer < Serializer
      attribute(:id)                     { object[:proje_id].safe_to_i                      }
      attribute(:name)                   { object[:proje_ad].titleize_tr                    }
      attribute(:subject)                { object[:proje_konusu].titleize_tr                }
      attribute(:status_id)              { object[:proje_durumu_id].safe_to_i               }
      attribute(:status_name)            { object[:proje_durumu_ad].titleize_tr             }
      attribute(:date_of_update)         { Time.zone.parse object[:guncelleme_tarihi] || '' }
      attribute(:budget)                 { object[:butce].safe_to_i                         }
      attribute(:location_id)            { object[:proje_konumu_id].safe_to_i               }
      attribute(:location_name)          { object[:proje_konumu_ad].titleize_tr             }
      attribute(:type_id)                { object[:proje_turu_id].safe_to_i                 }
      attribute(:type_name)              { object[:proje_turu_ad].titleize_tr               }
      attribute(:currency_id)            { object[:para_birimi_id].safe_to_i                }
      attribute(:currency_name)          { object[:para_birimi_ad].titleize_tr              }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                   }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr              }
      attribute(:scope_id)               { object[:kapsam].safe_to_i                        }
      attribute(:scope_name)             { object[:kapsam_ad].titleize_tr                   }
      attribute(:title_id)               { object[:unvan_id].safe_to_i                      }
      attribute(:title_name)             { object[:unvan_ad].titleize_tr                    }
      attribute(:university_id)          { object[:kurum_id].safe_to_i                      }
      attribute(:university_name)        { object[:kurum_ad].titleize_tr                    }
      attribute(:incentive_point)        { object[:tesv_puan].safe_to_f                     }

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
