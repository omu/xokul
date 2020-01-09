# frozen_string_literal: true

require_relative 'kps/constants'

require_relative 'kps/queries'
require_relative 'kps/verifications'

module Services
  module Kps
    ENDPOINTS = %i[queries verifications].freeze
  end
end
