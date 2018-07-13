# frozen_string_literal: true

# WIP
module Services
  class Response
    delegate :to_hash, :to_json, to: :@soap_object

    attr_reader :header, :body

    def initialize(soap_object)
      @soap_object = soap_object
      @header      = soap_object.header
      @body        = soap_object.body
    end
  end
end
