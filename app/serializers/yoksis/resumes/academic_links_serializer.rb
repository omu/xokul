# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicLinksSerializer < Serializer
      attribute(:researcher_id)    { integer object[:arastirmaci_id]                      }
      attribute(:staff_first_name) { string  object[:personel_adi],     method: :titleize }
      attribute(:staff_last_name)  { string  object[:personel_soyadi],  method: :titleize }
      attribute(:staff_title)      { string  object[:kadro_unvan_adi],  method: :titleize }
      attribute(:staff_workplace)  { string  object[:kadro_yeri],       method: :titleize }
      attribute(:yok_link)         { string  object[:yokakademik_link]                    }
      attribute(:photograph_link)  { string  object[:resim_link]                          }
    end
  end
end
