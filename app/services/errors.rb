# frozen_string_literal: true

module Services
  class Error < StandardError
    def initialize(object)
      @object = object
      super
    end

    def details
      [message]
    end

    def message
      "#{code} #{string}"
    end

    attr_reader :object
  end

  class HTTPError < Error
    def http_object
      object
    end

    def code
      http_object.http.code
    end

    def string
      Rack::Utils::HTTP_STATUS_CODES[code]
    end
  end

  class SOAPError < Error
    def soap_object
      object
    end

    def code
      soap_object.to_hash[:fault][:faultcode].to_i
    end

    def string
      soap_object.to_hash[:fault][:faultstring]
    end
  end
end
