# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicLinksSerializer < Serializer
      attribute(:researcher_id)    { integer object[:arastirmaci_id]                            }
      attribute(:staff_first_name) { string  object[:personel_adi]                              }
      attribute(:staff_last_name)  { string  object[:personel_soyadi]                           }
      attribute(:staff_title)      { string  object[:kadro_unvan_adi]                           }
      attribute(:staff_workplace)  { string  object[:kadro_yeri]                                }
      attribute(:yok_link)         { string  object[:yokakademik_link], titleize_turkish: false }
      attribute(:photograph_link)  { string  object[:resim_link]                                }
    end
  end
end
