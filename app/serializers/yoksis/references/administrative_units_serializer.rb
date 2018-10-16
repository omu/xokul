# frozen_string_literal: true

module Yoksis
  module References
    class AdministrativeUnitsSerializer < Serializer
      attribute(:unit_name)      { string  object[:birim_adi], ->(p) { p.upcase :turkic } }
      attribute(:unit_id)        { integer object[:birim_id]                              }
      attribute(:parent_unit_id) { integer object[:bagli_oldugu_birim_id]                 }
    end
  end
end
