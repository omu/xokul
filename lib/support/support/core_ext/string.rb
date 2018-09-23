# frozen_string_literal: true

class String
  def capitalize_tr
    capitalize :turkic
  end

  def titleize_tr
    downcase_tr.gsub(/\b(?<!\w['’`])[a-zçğöşü]/, &:capitalize_tr)
  end

  def downcase_tr
    downcase :turkic
  end

  def upcase_tr
    upcase :turkic
  end

  def safe_to_f
    tr(',', '.').to_f
  end

  alias safe_to_i to_i
end
