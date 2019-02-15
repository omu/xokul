# frozen_string_literal: true

require_relative 'yoksis/graduate'
require_relative 'yoksis/meb'
require_relative 'yoksis/reference'
require_relative 'yoksis/resume'
require_relative 'yoksis/staff'
require_relative 'yoksis/unit'

module Service
  module Yoksis
    include ActiveSupport::Configurable
    
    config_accessor :username, :password, :client_id, :client_secret
  end
end
