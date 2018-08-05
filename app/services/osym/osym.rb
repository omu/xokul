# frozen_string_literal: true

require_relative 'lib/version'

module Services
  class Osym
    require_relative "lib/#{VERSION}/examination"

    def self.module
      "#{inspect}::#{VERSION.upcase}".constantize
    end
  end
end
