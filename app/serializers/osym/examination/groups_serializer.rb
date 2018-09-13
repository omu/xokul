# frozen_string_literal: true

module Osym
  module Examination
    class GroupsSerializer < ActiveModel::Serializer
      attribute(:id)   { object[:id].safe_to_i }
      attribute(:name) { object[:ad]           }
    end
  end
end
