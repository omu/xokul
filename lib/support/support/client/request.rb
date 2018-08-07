# frozen_string_literal: true

module Support
  class Client
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
  end
end
