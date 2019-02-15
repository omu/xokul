# frozen_string_literal: true

require_relative 'service/detsis'
require_relative 'service/mernis'
require_relative 'service/yoksis'

module Service
  CREDENTIALS = Rails.application.credentials.tenant[Tenant.active_tenant]

  Yoksis.configure do |config|
    config.username      = CREDENTIALS.yoksis[:username]
    config.password      = CREDENTIALS.yoksis[:password]
    config.client_id     = CREDENTIALS.yoksis[:client_id]
    config.client_secret = CREDENTIALS.yoksis[:client_secret]
  end
end
