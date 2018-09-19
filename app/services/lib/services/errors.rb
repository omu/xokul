# frozen_string_literal: true

module Services
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

  class InvalidResponseError < Error
    def code
      500
    end

    def to_s
      'Third-party service has sent an invalid response'
    end
  end

  class NoContentError < Error
    def code
      204
    end

    def to_s
      'Third-party service has sent an empty response'
    end
  end
end
