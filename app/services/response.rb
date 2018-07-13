# frozen_string_literal: true

module Services
  class Response
    delegate :body, :http_fault?, :soap_fault?, :successful?, :to_hash,
             :to_json, to: :@object

    def initialize(object)
      @object = object
    end

    # In future
    def mapper; end
  end
end
