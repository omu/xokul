# frozen_string_literal: true

module Services
  class Endpoint
    include ActiveSupport::Configurable
    
    attr_reader :conn
    config_accessor :synopsis, :version, :url, instance_writer: false
    
    def initialize
      @conn = Connection.new(url)
    end

    protected :config, :conn
  end
end
