# frozen_string_literal: true

class String
  COMMON_ABBREVIATIONS = %w[
    ab abd abitur act ales aselsan aihm baum cmk cmuk dgs gata gce khk kktc kpds kpss les meb myo omü sat tbmm tck
    todaie toefl trt tsk tübitak uzem yds ydus ygs yök yös ömss öss ösym ösys öyp üds
  ].freeze

  TURKISH_CONJUNCTIONS = %w[
    ve veya veyahut oysa oysaki ki ise ile hem hele fakat çünkü ama
  ].freeze

  def titleize_turkish
    downcase(:turkic).split.map do |word|
      if COMMON_ABBREVIATIONS.include? word
        word.upcase(:turkic)
      elsif TURKISH_CONJUNCTIONS.include? word
        word
      else
        word.capitalize(:turkic)
      end
    end.join(' ')
  end
end
