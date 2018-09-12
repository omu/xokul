# frozen_string_literal: true

require 'test_helper'

module Yoksis
  class References < ActiveSupport::TestCase
    setup do
      @references = Services::Yoksis::References.new
    end

    test 'Check response of administrative_units' do
      VCR.use_cassette('yoksis/references/administrative_units_cassette') do
        @references.administrative_units.each do |unit|
          assert unit.key?(:birim_id)
          assert unit.key?(:birim_adi)
          assert unit.key?(:bagli_oldugu_birim_id)
        end
      end
    end

    test 'Check response of districts' do
      VCR.use_cassette('yoksis/references/districts_cassette') do
        @references.districts(city_code: 33).each do |district|
          assert_kod_ad district
        end
      end
    end

    Services::Yoksis::References::METHOD_VARIABLES.each_key do |method|
      next if %i[districts administrative_units].include?(method)
      test "Check response of #{method}" do
        VCR.use_cassette("yoksis/references/#{method}_cassette") do
          @references.send(method).each { |city| assert_kod_ad city }
        end
      end
    end
  end
end
