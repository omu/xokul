# frozen_string_literal: true

class SoapClient
  class Error < StandardError; end

  class SavonError < Error; end

  Response = Struct.new(:savon_response) do
    delegate :header, :body, to: :savon_response
    delegate :dig, to: :body
  end

  private_constant :Response

  delegate :operations, to: :@savon_object

  def initialize(wsdl_url, **savon_options)
    @savon_object = Savon.client(wsdl: wsdl_url, **savon_options)
  end

  def request(operation, message: {})
    raise ArgumentError, 'Request message must be Hash' unless message.is_a?(Hash)

    Response.new(
      savon_object.call(operation, message: message.deep_stringify_keys)
    )
  rescue Savon::Error => err
    raise SavonError, err
  end

  def configure(&blk)
    savon_object.globals.instance_eval(&blk) if block_given?
    self
  end

  def inspect
    "#<#{self.class}:0x00%x>" % (object_id << 1)
  end

  protected

  attr_reader :savon_object
end
