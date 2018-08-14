# frozen_string_literal: true

module Yoksis
  module Meb
    class GradInformationsSerializer < ActiveModel::Serializer
      attribute(:description) { object[:aciklama] }
    end
  end
end
