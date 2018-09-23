# frozen_string_literal: true

module Yoksis
  module Staff
    class AcademiciansSerializer < Serializer
      attribute(:id_number)  { object[:tc_kimlik_no].safe_to_i  }
      attribute(:first_name) { object[:adi].titleize_tr         }
      attribute(:last_name)  { object[:soyadi].titleize_tr      }
      attribute(:title)      { object[:kadro_unvan].titleize_tr }
      attribute(:unit_id)    { object[:birim_id].safe_to_i      }
    end
  end
end
