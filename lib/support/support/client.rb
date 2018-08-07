# frozen_string_literal: true

require_relative 'client/errors'
require_relative 'client/response'
require_relative 'client/request'

module Support
  class Client
    attr_reader :savon

    def initialize(document_url)
      @savon = Savon.client(wsdl: document_url)
      configure_with_defaults
    end

    def basic_auth(username, password)
      configure { |config| config.basic_auth [username, password] }
    end

    def wsse_auth(username, password)
      configure { |config| config.wsse_auth [username, password] }
    end

    def configure
      yield savon.globals if block_given?
    end

    private

    def configure_with_defaults
      configure do |config|
        config.convert_request_keys_to 'camelcase'
        config.encoding 'UTF-8'
      end
    end
  end
end
