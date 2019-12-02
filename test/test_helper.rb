# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

Dir[Rails.root.join('test/support/**/*.rb')].each do |file|
  require file
end

module ActiveSupport
  class TestCase
    fixtures :all

    def assert_kod_ad(object)
      assert object.key?(:kod)
      assert object.key?(:ad)
    end
  end
end
