# frozen_string_literal: true

require_relative 'service/endpoint'
require_relative 'service/detsis'
require_relative 'service/mernis'
require_relative 'service/yoksis'
require_relative 'service/tenant'

module Service
  Yoksis.configure do |config|
    config.username      = Tenant.credentials.yoksis[:username]
    config.password      = Tenant.credentials.yoksis[:password]
    config.client_id     = Tenant.credentials.yoksis[:client_id]
    config.client_secret = Tenant.credentials.yoksis[:client_secret]
  end
end
