# frozen_string_literal: true

require_relative 'services/errors'
require_relative 'services/yoksis'
require_relative 'services/kps'
require_relative 'services/osym'
require_relative 'services/version'

module Services
  AVAILABLE_SERVICES = { version: VERSION, services: %i[osym kps yoksis] }.freeze

  def self.service_endpoints(service)
    const_get "#{service}::ENDPOINTS"
  end
end
