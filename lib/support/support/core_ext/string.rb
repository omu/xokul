# frozen_string_literal: true

class String
  alias safe_to_i to_i

  def safe_to_f
    tr(',', '.').to_f
  end
end
