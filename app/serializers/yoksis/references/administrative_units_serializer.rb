# frozen_string_literal: true

module Yoksis
  module References
    class AdministrativeUnitsSerializer < ActiveModel::Serializer
      attribute(:id)             { object[:birim_id].try(:to_i)              }
      attribute(:name)           { object[:birim_adi]                        }
      attribute(:parent_unit_id) { object[:bagli_oldugu_birim_id].try(:to_i) }
    end
  end
end
