# frozen_string_literal: true

module Yoksis
  module Staff
    class NationalitiesSerializer < Serializer
      attribute(:code) { object[:kod].try(:to_i) }
      attribute(:name) { object[:ad]             }
    end
  end
end
