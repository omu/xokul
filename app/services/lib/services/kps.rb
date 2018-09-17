# frozen_string_literal: true

require_relative 'kps/base'
require_relative 'kps/constants'

require_relative 'kps/endpoints/queries'
require_relative 'kps/endpoints/verifications'

module Services
  module Kps
    ENDPOINTS = %i[queries verifications].freeze
  end
end
