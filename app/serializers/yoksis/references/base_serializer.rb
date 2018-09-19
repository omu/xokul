# frozen_string_literal: true

module Yoksis
  module References
    class BaseSerializer < Serializer
      attribute(:code) { object[:kod].safe_to_i }
      attribute(:name) { object[:ad].capitalize }
    end
  end
end
