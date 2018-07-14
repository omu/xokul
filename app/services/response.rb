# frozen_string_literal: true

module Services
  class Response
    delegate :body, :http_fault?, :soap_fault?, :successful?, :to_hash,
             :to_json, to: :@object

    def initialize(object)
      @object = object
    end

    # WIP
    def collection(key)
      to_hash.first.last[key]
    end

    # In future
    def mapper; end
  end
end
