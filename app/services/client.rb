# frozen_string_literal: true

module Services
  class Client
    def initialize(document_url)
      @client = Savon.client(wsdl: document_url)
      configure_with_defaults
    end

    # Still WIP
    def call(action, **arguments)
      Response.new(@client.call(action, message: arguments.stringify_keys))
    rescue Savon::HTTPError => err
      HTTPError.new(err)
    rescue Savon::SOAPFault => err
      SOAPError.new(err)
    end

    def basic_auth(username, password)
      configure { |config| config.basic_auth [username, password] }
    end

    def wsse_auth(username, password)
      configure { |config| config.wsse_auth [username, password] }
    end

    def configure
      yield @client.globals if block_given?
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
