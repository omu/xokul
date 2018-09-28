# frozen_string_literal: true

module Yoksis
  module References
    class BaseSerializer < Serializer
      attribute(:code) { integer object[:kod]                   }
      attribute(:name) { string  object[:ad], method: :titleize }
    end
  end
end
