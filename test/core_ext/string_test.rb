# frozen_string_literal: true

require 'test_helper'

class StringTest < ActiveSupport::TestCase
  test 'titleize_turkish can titleize a sentence in Turkish' do
    cases = [
      ['istinye Çarşısı',     'İstinye Çarşısı'],
      ['doğru ve yanlış',     'Doğru ve Yanlış'],
      ['Şekerli çay',         'Şekerli Çay'],
      ['üzümlü Kek',          'Üzümlü Kek'],
      ['sıcak veya Ilık Süt', 'Sıcak veya Ilık Süt']
    ]

    cases.each { |c| assert_equal c.first.titleize_turkish, c.last }
  end
end
