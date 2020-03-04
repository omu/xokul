# frozen_string_literal: true

module Xokul
  module Client
    module Default
      # Default endpoint points mock server
      ENDPOINT = 'https://mock.api.omu.sh'

      # ActiveSupport compatible instrumenter
      INSTRUMENTER = ActiveSupport::Notifications.instrumenter
    end
  end
end
