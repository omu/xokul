# frozen_string_literal: true

module Yoksis
  module Staff
    class AcademiciansSerializer < Serializer
      attribute(:id_number)  { object[:tc_kimlik_no].try(:to_i) }
      attribute(:first_name) { object[:adi]                     }
      attribute(:last_name)  { object[:soyadi]                  }
      attribute(:title)      { object[:kadro_unvan]             }
      attribute(:unit_id)    { object[:birim_id].try(:to_i)     }
    end
  end
end
