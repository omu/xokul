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
      "#{code} #{self}"
    end

    protected

    attr_reader :object
  end

  class HTTPError < Error
    def http_object
      object.http
    end

    def code
      http_object.code
    end

    def to_s
      Rack::Utils::HTTP_STATUS_CODES[code]
    end
  end

  class SOAPError < Error
    def fault_object
      object.to_hash[:fault]
    end

    def code
      fault_object[:faultcode].to_i
    end

    def to_s
      fault_object[:faultstring]
    end
  end

  class UnknownOperationError < Error
    def code
      500
    end

    def to_s
      'unable to find soap operation (it may have changed or removed)'
    end
  end

  class TCPError < Error
    def code
      500
    end

    def to_s
      'failed to connect to the external service'
    end
  end
end
