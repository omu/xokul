# frozen_string_literal: true

class Client
  class Error < StandardError
    def initialize(object = nil)
      @object = object
      super
    end

    def message
      to_s
    end

    protected

    attr_reader :object
  end

  class HTTPError < Error
    def code
      http_object.code
    end

    private

    def http_object
      object.http
    end
  end

  class SOAPError < Error
    def code
      500
    end

    def to_s
      'Server was unable to process soap request'
    end
  end

  class TCPError < Error
    def code
      500
    end

    def to_s
      'There was a problem connecting to external server'
    end
  end

  class UnknownOperationError < Error
    def code
      500
    end

    def to_s
      'Unable to find soap operation'
    end
  end
end
