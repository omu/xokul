# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

require 'webmock/minitest'
WebMock.disable_net_connect!(allow: %w[api.codacy.com], allow_localhost: true)

module ActiveSupport
  class TestCase
    fixtures :all
  end
end
