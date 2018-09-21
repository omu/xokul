# frozen_string_literal: true

require 'test_helper'

module Yoksis
  class References < ActiveSupport::TestCase
    setup do
      @references = Services::Yoksis::References.new
      VCR.configure do |config|
        config.default_cassette_options = {
          record: :new_episodes,
          re_record_interval: 3.days
        }
      end
    end

    test 'Check presence of required keys in administrative_units response' do
      VCR.use_cassette('yoksis/references/administrative_units') do
        @references.administrative_units.each do |unit|
          assert unit.key?(:birim_id)
          assert unit.key?(:birim_adi)
          assert unit.key?(:bagli_oldugu_birim_id)
        end
      end
    end

    test 'Check presence of required keys in districts response' do
      VCR.use_cassette('yoksis/references/districts') do
        @references.districts(city_code: 33).each do |district|
          assert_kod_ad district
        end
      end
    end

    Services::Yoksis::References::ARGS.each_key do |method|
      next if method.in?(%i[administrative_units districts])

      test "Check presence of required keys in #{method} response" do
        VCR.use_cassette("yoksis/references/#{method}") do
          @references.send(method).each do |object|
            assert_kod_ad object
          end
        end
      end
    end
  end
end
