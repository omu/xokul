# frozen_string_literal: true

class Serializer < ActiveModel::Serializer
  def build_date(*args)
    return if nil.in?(args)
    Date.new(*args.collect(&:safe_to_i))
  end

  def build_time(*args)
    return if nil.in?(args)
    Time.utc(*args.collect(&:safe_to_i))
  end
end
