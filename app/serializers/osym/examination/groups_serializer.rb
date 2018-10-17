# frozen_string_literal: true

module Osym
  module Examination
    class GroupsSerializer < ActiveModel::Serializer
      attribute(:id)   { integer object[:id]                             }
      attribute(:name) { string  object[:ad], ->(p) { p.upcase :turkic } }
    end
  end
end
