# frozen_string_literal: true

module Detsis
  class TypeTwoCodesSerializer < TypeOneCodesSerializer
    attribute(:used) { boolean object[:used] } 
  end
end
  