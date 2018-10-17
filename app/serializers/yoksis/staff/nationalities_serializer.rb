# frozen_string_literal: true

module Yoksis
  module Staff
    class NationalitiesSerializer < Serializer
      attribute(:code) { integer object[:kod] }
      attribute(:name) { string  object[:ad]  }
    end
  end
end
