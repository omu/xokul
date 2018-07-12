# frozen_string_literal: true

module Services
  class Client
    attr_reader :client

    def initialize(document_url)
      @client = Savon.client do |config|
        config.convert_request_keys_to 'camelcase'
        config.encoding 'UTF-8'
        config.wsdl document_url
      end
    end

    # WIP
    def call(action, **arguments)
      client.call(action, message: arguments.stringify_keys)
    rescue StandardError
      raise
    end

    def basic_auth(username, password)
      configure { |config| config.basic_auth [username, password] }
    end

    def wsse_auth(username, password)
      configure { |config| config.wsse_auth [username, password] }
    end

    def configure
      yield client.globals if block_given?
    end
  end
end
