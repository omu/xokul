# frozen_string_literal: true

module Yoksis
  module Resumes
    class ProjectsSerializer < Serializer
      attribute(:id)                     { object[:proje_id].try(:to_i)            }
      attribute(:name)                   { object[:proje_ad]                       }
      attribute(:subject)                { object[:proje_konusu]                   }
      attribute(:status_id)              { object[:proje_durumu_id].try(:to_i)     }
      attribute(:status_text)            { object[:proje_durumu_ad]                }
      attribute(:started_at)             { build_date(*object[:bas_tar].split('.').reverse.collect(&:to_i)) }
      attribute(:ended_at)               { build_date(*object[:bit_tar].split('.').reverse.collect(&:to_i)) }
      attribute(:updated_at)             { Time.parse(object[:guncelleme_tarihi])  }
      attribute(:budget)                 { object[:butce].try(:to_i)               }
      attribute(:konumu_id)              { object[:proje_konumu_id].try(:to_i)     } # TODO
      attribute(:konumu_text)            { object[:proje_konumu_ad]                } # TODO
      attribute(:type_id)                { object[:proje_turu_id].try(:to_i)       }
      attribute(:type_text)              { object[:proje_turu_ad]                  }
      attribute(:currency_id)            { object[:para_birimi_id].try(:to_i)      }
      attribute(:currency_text)          { object[:para_birimi_ad]                 }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].try(:to_i)         }
      attribute(:active_or_passive_text) { object[:aktif_pasif_ad]                 }
      attribute(:purview_id)             { object[:kapsam].try(:to_i)              }
      attribute(:purview_text)           { object[:kapsam_ad]                      }
      attribute(:academic_title_id)      { object[:unvan_id].try(:to_i)            }
      attribute(:academic_title_text)    { object[:unvan_ad]                       }
      attribute(:university_id)          { object[:kurum_id].try(:to_i)            }
      attribute(:university_name)        { object[:kurum_ad]                       }
      attribute(:tesv_point)             { object[:tesv_puan].try(:to_f)           }
    end
  end
end
