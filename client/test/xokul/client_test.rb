# frozen_string_literal: true

require 'test_helper'

module Xokul
  class ClientTest < Minitest::Test
    def test_that_it_has_a_version_number
      assert_not_nil ::Xokul::Client::VERSION
    end

    def test_it_does_something_useful
      assert false
    end
  end
end
