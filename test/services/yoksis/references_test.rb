# frozen_string_literal: true

require 'test_helper'

module Yoksis
  class References < ActiveSupport::TestCase
    setup do
      VCR.use_cassette('yoksis_references_cassette') do
        @client = Client.new(Services::Yoksis.module_path::References::WSDL_URL)
      end
    end
  end
end
