# frozen_string_literal: true

require_relative 'client/errors'
require_relative 'client/response'

class Client
  attr_reader :savon

  def initialize(wsdl_url, savon_options: {})
    @savon = Savon.client(wsdl: wsdl_url, **savon_options)
    configure_with_defaults
  end

  def request(operation, args: {})
    Response.new(savon.call(operation, message: args.deep_stringify_keys))
  rescue Savon::HTTPError => e
    raise HTTPError, e
  rescue Savon::SOAPFault => e
    raise SOAPError, e
  rescue Savon::UnknownOperationError => e
    raise UnknownOperationError, e
  rescue SocketError => e
    raise TCPError, e
  end

  def add_soap_header(key, value)
    configure { |config| config.soap_header(key.to_s => value) }
  end

  def add_namespace(key, value)
    configure { |config| config.namespaces(key.to_s => value) }
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
