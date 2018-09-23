# frozen_string_literal: true

module Yoksis
  module References
    class AdministrativeUnitsSerializer < Serializer
      attribute(:id)             { object[:birim_id].safe_to_i              }
      attribute(:name)           { object[:birim_adi].titleize_tr           }
      attribute(:parent_unit_id) { object[:bagli_oldugu_birim_id].safe_to_i }
    end
  end
end
