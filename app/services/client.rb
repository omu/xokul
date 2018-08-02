# frozen_string_literal: true

module Services
  class Client
    def initialize(document_url)
      @wsdl = Savon.client(wsdl: document_url)
      configure_with_defaults
    end

    # Still WIP
    def call(action, **arguments)
      Response.new(action, @wsdl.call(action, message: arguments.stringify_keys))
    rescue Savon::HTTPError => err
      raise HTTPError, err
    rescue Savon::SOAPClient => err
      raise SOAPFault, err
    rescue Savon::UnknownOperationError => err
      raise UnknownOperationError, err
    rescue SocketError => err
      raise TCPError, err
    end

    def basic_auth(username, password)
      configure { |config| config.basic_auth [username, password] }
    end

    def wsse_auth(username, password)
      configure { |config| config.wsse_auth [username, password] }
    end

    def configure
      yield @wsdl.globals if block_given?
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
