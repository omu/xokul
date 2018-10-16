# frozen_string_literal: true

class Serializer < ActiveModel::Serializer
  def float(object)
    case object
    when NilClass
      return
    when Float
      object
    when Nori::StringWithAttributes, String
      object.tr(',', '.').to_f
    when Integer
      object.to_f
    else
      raise TypeError, "#{object} is not an Float or convertable type"
    end
  end

  def integer(object)
    case object
    when NilClass
      return
    when Integer
      object
    when Float, Nori::StringWithAttributes, String
      object.to_i
    else
      raise TypeError, "#{object} is not an Integer or convertable type"
    end
  end

  def split_string(object, block = nil, separator: ',', titleize_turkish: true)
    return unless object
    raise TypeError, "#{object} is not a String" unless object.is_a?(String)

    split = object.split(separator)

    split.map!(&:titleize_turkish) if titleize_turkish
    block ? split.try(&block) : split
  end

  def string(object, block = nil, titleize_turkish: true)
    str = case object
    when NilClass
      return
    when String, Nori::StringWithAttributes
      object
    when Float, Integer
      object.to_s
    else
      raise TypeError, "#{object} is not an String or convertable type"
    end

    str = titleize_turkish ? str.titleize_turkish : str
    block ? str.try(&block) : str
  end

  def build_date(*args)
    return unless args.all?

    args.map! do |arg|
      case arg
      when Nori::StringWithAttributes, String
        arg.to_i
      end
    end

    Date.new(*args)
  end

  def build_datetime(*args)
    return unless args.all?

    args.map! do |arg|
      case arg
      when Nori::StringWithAttributes, String
        arg.to_i
      end
    end

    DateTime.civil(*args)
  end

  def parse_date(object)
    return unless object

    Date.parse object.to_s
  end

  def parse_datetime(object)
    return unless object

    DateTime.parse object.to_s
  end
end
