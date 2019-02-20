# frozen_string_literal: true

require_relative 'services/endpoint'
require_relative 'services/service'

require_relative 'services/detsis'
require_relative 'services/mernis'
require_relative 'services/yoksis'

module Services
  Yoksis.configure do |config|
    config.username      = Tenant.credentials.yoksis[:username]
    config.password      = Tenant.credentials.yoksis[:password]
    config.client_id     = Tenant.credentials.yoksis[:client_id]
    config.client_secret = Tenant.credentials.yoksis[:client_secret]
  end
end
