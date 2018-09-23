# frozen_string_literal: true

module Yoksis
  module Staff
    class NationalitiesSerializer < Serializer
      attribute(:code) { object[:kod].safe_to_i  }
      attribute(:name) { object[:ad].titleize_tr }
    end
  end
end
