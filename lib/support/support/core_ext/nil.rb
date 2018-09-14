# frozen_string_literal: true

class NilClass
  def safe_to_i
    nil
  end

  def safe_to_f
    nil
  end
end
