# frozen_string_literal: true

class NilClass
  def nil_object
    nil
  end

  alias safe_to_i     nil_object
  alias safe_to_f     nil_object
  alias downcase_tr   nil_object
  alias capitalize_tr nil_object
  alias titleize      nil_object
  alias titleize_tr   nil_object
  alias upcase_tr     nil_object
end
