# frozen_string_literal: true

module TurkishSupport
  module Refinery
    refine String do
      def acronymize
        split.map(&:first).join.upcase
      end

      def capitalize
        super(:turkic)
      end

      def downcase
        super(:turkic)
      end

      def titleize
        split.map do |word|
          word.gsub(TITLEIZE_RE) do |match|
            downcased = match.downcase

            next downcased if CONJUNCTIONS.include?(downcased)
            next ABBREVIATIONS[downcased] if ABBREVIATIONS[downcased]
            next ACRONYMS[downcased] if ACRONYMS[downcased]

            downcased.capitalize
          end
        end.join ' '
      end

      def upcase
        super(:turkic)
      end
    end
  end

  private_constant :Refinery
end
