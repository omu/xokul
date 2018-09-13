# frozen_string_literal: true

module Yoksis
  module Staff
    class AcademiciansSerializer < Serializer
      attribute(:id_number)  { object[:tc_kimlik_no].safe_to_i }
      attribute(:first_name) { object[:adi]                    }
      attribute(:last_name)  { object[:soyadi]                 }
      attribute(:title)      { object[:kadro_unvan]            }
      attribute(:unit_id)    { object[:birim_id].safe_to_i     }
    end
  end
end
