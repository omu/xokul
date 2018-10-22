# frozen_string_literal: true

module Yoksis
  module Staff
    class TotalPagesSerializer < Serializer
      attribute(:total_pages) { integer object }
    end
  end
end
