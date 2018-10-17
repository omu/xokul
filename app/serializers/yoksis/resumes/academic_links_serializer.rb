# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicLinksSerializer < Serializer
      attribute(:photograph_link)  { string  object[:resim_link],       case_conversion: false }
      attribute(:researcher_id)    { integer object[:arastirmaci_id]                           }
      attribute(:staff_first_name) { string  object[:personel_adi]                             }
      attribute(:staff_last_name)  { string  object[:personel_soyadi]                          }
      attribute(:staff_location)   { string  object[:kadro_yeri]                               }
      attribute(:staff_title)      { string  object[:kadro_unvan_adi]                          }
      attribute(:yok_link)         { string  object[:yokakademik_link], case_conversion: false }
    end
  end
end
