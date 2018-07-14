# frozen_string_literal: true

class ErrorSerializer < ActiveModel::Serializer
  attribute(:code)    { object.code }
  attribute(:message) { object.to_s }
end
