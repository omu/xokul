# frozen_string_literal: true

class String
  TURKISH_CONJUNCTIONS = %w[
    ama ancak dahi fakat ile lakin ve veya yani
  ].freeze
  private_constant :TURKISH_CONJUNCTIONS

  def titleize_turkish
    downcase(:turkic).split.map do |word|
      next word if TURKISH_CONJUNCTIONS.include?(word)

      word.capitalize(:turkic)
    end.join ' '
  end
end
