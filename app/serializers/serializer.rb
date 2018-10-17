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

  def split_string(object, block = nil, separator: ',', case_conversion: true)
    return unless object
    raise TypeError, "#{object} is not a String" unless object.is_a?(String)

    splitted = object.split(separator)
    splitted.map!(&:titleize_turkish) if case_conversion

    block ? splitted.try(&block) : splitted
  end

  def string(object, block = nil, case_conversion: true)
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

    str = case_conversion ? str.titleize_turkish : str
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
