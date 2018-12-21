# frozen_string_literal: true

class Symbol
  def camelize
    to_s.camelize.to_sym
  end
end
