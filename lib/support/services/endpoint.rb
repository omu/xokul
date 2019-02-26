# frozen_string_literal: true

module Services
  class Endpoint
    include ActiveSupport::Configurable

    config_accessor :name, :url, :version, :synopsis, instance_writer: false

    def initialize
      @client = SoapClient.new(config.url)

      after_initialize
    end

    def after_initialize; end

    protected

    attr_reader :client
  end
end
