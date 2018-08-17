# frozen_string_literal: true

module Yoksis
  module Staff
    class PagesSerializer < Serializer
      attribute(:total_page_number) { object.try(:to_i) }
    end
  end
end
