# frozen_string_literal: true

module Yoksis
  module References
    class IndexesSerializer < BaseSerializer
      attribute(:english_name) { string object[:ad_en] }
    end
  end
end
