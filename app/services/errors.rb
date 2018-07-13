# frozen_string_literal: true

module Services
  class Error < StandardError
    def details
      [message]
    end
  end

  class HTTPError < Error
    def initialize(object)
      @object = object
      super
    end

    def message
      "#{code} #{string}"
    end

    def code
      @object.http.code
    end

    def string
      Rack::Utils::HTTP_STATUS_CODES[code]
    end
  end

  class SOAPError < Error
    def initialize(object)
      @object = object.to_hash[:fault]
      super
    end

    def message
      "(#{code}) #{string}"
    end

    def code
      @object[:faultcode].to_i
    end

    def string
      @object[:faultstring]
    end
  end
end
