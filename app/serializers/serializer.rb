# frozen_string_literal: true

class Serializer < ActiveModel::Serializer
  def build_date(*args)
    return nil if args.index(nil)
    Date.new(*args.collect(&:to_i))
  end

  def build_time(*args)
    return nil if args.index(nil)
    Time.new.utc(*args.collect(&:to_i))
  end
end
