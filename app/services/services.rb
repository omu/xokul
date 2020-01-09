# frozen_string_literal: true

require_relative 'errors'
require_relative 'yoksis'
require_relative 'detsis'
require_relative 'kps'
require_relative 'meksis'
require_relative 'osym'

module Services
  AVAILABLE_SERVICES = { services: %i[detsis osym kps meksis yoksis] }.freeze

  def self.service_endpoints(service)
    const_get "#{service}::ENDPOINTS"
  end
end
