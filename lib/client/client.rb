# frozen_string_literal: true

require_relative 'client/errors'
require_relative 'client/response'

class Client
  attr_reader :savon

  def initialize(wsdl_url)
    @savon = Savon.client(wsdl: wsdl_url)
    configure_with_defaults
  end

  def request(operation:, args: {})
    Response.new(savon.call(operation, message: args.deep_stringify_keys))
  rescue Savon::HTTPError => err
    raise HTTPError, err
  rescue Savon::SOAPFault => err
    raise SOAPError, err
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

  def add_soap_header(key, value)
    configure { |config| config.soap_header.deep_merge!("#{key}": value) }
  end

  def add_namespace(key, value)
    configure { |config| config.namespaces.deep_merge!("#{key}": value) }
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
