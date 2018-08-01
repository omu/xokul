# frozen_string_literal: true

require 'securerandom'

module Services
  module Kps
    module Private
      Sts = Struct.new(:username, :password, :endpoint, :reference, keyword_argument: true) do
        def token
          Utils.http_get(
            url,
            body: format(
              STS_TEMPLATE,
              created_time: Utils.timestamp,
              endpoint:     endpoint,
              expires_time: Utils.timestamp(600),
              password:     password,
              reference:    reference,
              username:     username,
              uuid:         SecureRandom.uuid
            )
          )
        end
      end
    end
  end
end
