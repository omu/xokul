# frozen_string_literal: true

module Services
  module Support
    class Error < StandardError
      def initialize(object)
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

      def identifier
        'savon_http_error'
      end

      def detailed
        Rack::Utils::HTTP_STATUS_CODES[code]
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

      def identifier
        'savon_soap_error'
      end

      def to_s
        fault_object[:faultstring]
      end

      private

      def fault_object
        object.to_hash[:fault]
      end
    end

    class TCPError < Error
      def code
        500
      end

      def identifier
        'savon_tcp_error'
      end

      def to_s
        'Failed to connect to the external service'
      end
    end

    class UnknownOperationError < Error
      def code
        500
      end

      def identifier
        'savon_unknown_operation_error'
      end

      def to_s
        'Unable to find soap operation (it may have changed or removed)'
      end
    end
  end
end
