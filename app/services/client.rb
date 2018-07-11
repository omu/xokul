# frozen_string_literal: true

module Services
  class Client
    delegate :call, to: :@client

    def initialize(wsdl_url, **extra_args)
      @client = Savon.client(
        wsdl: wsdl_url,
        encoding: 'UTF-8',
        convert_request_keys_to: 'camelcase', **extra_args
      )
    end
  end
end
