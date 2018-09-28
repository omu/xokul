# frozen_string_literal: true

class Serializer < ActiveModel::Serializer
  def build_date(*args)
    args.map! do |arg|
      case arg
      when Nori::StringWithAttributes, String
        arg.to_i
      end
    end
    Date.new(*args)
  rescue StandardError
    nil
  end

  def build_datetime(*args)
    args.map! do |arg|
      case arg
      when Nori::StringWithAttributes, String
        arg.to_i
      end
    end
    DateTime.civil(*args)
  rescue StandardError
    nil
  end

  def date(object)
    Date.parse object
  rescue StandardError
    nil
  end

  def datetime(object)
    DateTime.parse object
  rescue StandardError
    nil
  end

  def float(object)
    case object
    when Float
      return object
    when Integer
      return object.to_f
    when Nori::StringWithAttributes, String
      return object.tr(',', '.').to_f
    end
  end

  def integer(object)
    case object
    when Float, Nori::StringWithAttributes, String
      return object.to_i
    when Integer
      return object
    end
  end

  def split(string, separator:)
    return unless string

    string.split(separator).map { |item| item.titleize }
  end

  SUPPORTED_STRING_METHODS = %i[
    downcase
    titleize
    upcase
    capitalize
  ]
  private_constant :SUPPORTED_STRING_METHODS

  def string(object, method: nil)
    return if object.is_a?(NilClass)
    return object unless method.in?(SUPPORTED_STRING_METHODS)
    return object.titleize_turkish if method == :titleize

    object.send(method, :turkic)
  end
end
