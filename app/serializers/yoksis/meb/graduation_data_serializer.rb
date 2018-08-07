# frozen_string_literal: true

module Yoksis
  module Meb
    class GraduationDataSerializer < ActiveModel::Serializer
      attribute(:code)        { object[:sonuckodu] }
      attribute(:description) { object[:aciklama]  }
    end
  end
end
