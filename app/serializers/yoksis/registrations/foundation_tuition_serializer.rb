# frozen_string_literal: true

module Yoksis
  module Registrations
    class FoundationTuitionSerializer < ActiveModel::Serializer
      attribute(:description) { object[:durum_aciklama] }
    end
  end
end
