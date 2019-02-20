# frozen_string_literal: true

require_relative 'yoksis/graduates'
require_relative 'yoksis/meb'
require_relative 'yoksis/references'
require_relative 'yoksis/resume'
require_relative 'yoksis/staff'
require_relative 'yoksis/units'

module Services
  module Yoksis
    include ActiveSupport::Configurable

    config_accessor :username, :password, :client_id, :client_secret
  end
end
