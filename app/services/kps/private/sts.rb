# frozen_string_literal: true

require 'securerandom'

module Services
  module Kps
    module Private
      Sts = Struct.new(:username, :password, :endpoint, :reference, keyword_init: true) do
        # rubocop:disable Metrics/MethodLength
        def token
          Utils.http_get(
            endpoint,
            body: format(
              STS_TEMPLATE,
              created_time: Utils.timestamp,
              expires_time: Utils.timestamp(600),
              password:     password,
              reference:    reference,
              username:     username,
              uuid:         SecureRandom.uuid
            )
          )
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
