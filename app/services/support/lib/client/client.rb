# frozen_string_literal: true

module Services
  module Support
    class Client
      attr_reader :savon

      def initialize(document_url)
        @savon = Savon.client(wsdl: document_url)
        configure_with_defaults
      end

      def call(action, result_path:, **query_args)
        Response.new(savon.call(action, message: query_args.stringify_keys), result_path: result_path)
      rescue Savon::HTTPError => err
        raise HTTPError, err
      rescue Savon::SOAPFault => err
        raise SOAPError, err
      rescue Savon::UnknownOperationError => err
        raise UnknownOperationError, err
      rescue SocketError => err
        raise TCPError, err
      end

      def basic_auth(username, password)
        configure { |config| config.basic_auth [username, password] }
      end

      def wsse_auth(username, password)
        configure { |config| config.wsse_auth [username, password] }
      end

      def configure
        yield savon.globals if block_given?
      end

      private

      def configure_with_defaults
        configure do |config|
          config.convert_request_keys_to 'camelcase'
          config.encoding 'UTF-8'
        end
      end
    end
  end
end
