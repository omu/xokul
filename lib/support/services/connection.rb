# frozen_string_literal: true

module Services
  module Connection
    include ActiveSupport::Configurable

    config_accessor :fizz, :buzz
  end
end
