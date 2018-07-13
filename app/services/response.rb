# frozen_string_literal: true

# WIP
module Services
  class Response
    delegate :http_fault?, :soap_fault?, :successful?, :to_hash, :to_json,
             to: :@soap_object

    def initialize(soap_object)
      @soap_object = soap_object
      @body        = soap_object.body
      @status      = soap_object.status
    end

    attr_reader :body, :status
  end
end
