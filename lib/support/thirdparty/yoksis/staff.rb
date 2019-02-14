# frozen_string_literal: true

module Thirdparty
  module Yoksis
    class Staff
      include ActiveSupport::Configurable

      config_accessor :endpoint, :cliend_id, :client_secret,
                      instance_writer: false
    end
  end
end
