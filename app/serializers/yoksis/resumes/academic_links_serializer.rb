# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicLinksSerializer < Serializer
      attribute(:researcher_id)    { object[:arastirmaci_id].safe_to_i    }
      attribute(:staff_first_name) { object[:personel_adi].titleize_tr    }
      attribute(:staff_last_name)  { object[:personel_soyadi].titleize_tr }
      attribute(:staff_title)      { object[:kadro_unvan_adi].titleize_tr }
      attribute(:staff_workplace)  { object[:kadro_yeri].titleize_tr      }
      attribute(:yok_link)         { object[:yokakademik_link]            }
      attribute(:photograph_link)  { object[:resim_link]                  }
    end
  end
end
