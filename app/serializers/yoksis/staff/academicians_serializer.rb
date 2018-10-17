# frozen_string_literal: true

module Yoksis
  module Staff
    class AcademiciansSerializer < Serializer
      attribute(:id_number)  { integer object[:tc_kimlik_no] }
      attribute(:first_name) { string  object[:adi]          }
      attribute(:last_name)  { string  object[:soyadi]       }
      attribute(:title)      { string  object[:kadro_unvan]  }
      attribute(:unit_id)    { integer object[:birim_id]     }
    end
  end
end
