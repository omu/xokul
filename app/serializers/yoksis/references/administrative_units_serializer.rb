# frozen_string_literal: true

module Yoksis
  module References
    class AdministrativeUnitsSerializer < ActiveModel::Serializer
      attribute(:id)        { object[:birim_id]              }
      attribute(:name)      { object[:birim_adi]             }
      attribute(:parent_id) { object[:bagli_oldugu_birim_id] }
    end
  end
end
