# frozen_string_literal: true

module Yoksis
  module References
    class DistrictSerializer < ActiveModel::Serializer
      attribute(:code) { object[:kod] }
      attribute(:name) { object[:ad] }
    end
  end
end
