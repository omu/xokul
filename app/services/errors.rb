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
  end

  class HTTPError < Error
    def code
      @object.http.code
    end

    def string
      Rack::Utils::HTTP_STATUS_CODES[code]
    end
  end

  class SOAPError < Error
    def code
      @object.to_hash[:fault][:faultcode].to_i
    end

    def string
      @object.to_hash[:fault][:faultstring]
    end
  end
end
