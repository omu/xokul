# frozen_string_literal: true

require_relative 'lib/version'

module Services
  class Yoksis
    require_relative "lib/#{VERSION}/base"
    require_relative "lib/#{VERSION}/constants"
    require_relative "lib/#{VERSION}/graduations"
    require_relative "lib/#{VERSION}/meb"
    require_relative "lib/#{VERSION}/references"
    require_relative "lib/#{VERSION}/registrations"
    require_relative "lib/#{VERSION}/staff"
    require_relative "lib/#{VERSION}/student"
    require_relative "lib/#{VERSION}/units"

    def self.module
      "#{inspect}::#{VERSION.upcase}".constantize
    end
  end
end
