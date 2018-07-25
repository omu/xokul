# frozen_string_literal: true

module Services
  module Kps
    module Private
      class Service
        attr_reader :username, :password, :sts_url, :endpoint_reference

        def initialize(username, password)
          @username = username
          @password = password
        end

        def token
          Utils.http_get(
            sts_url,
            header: { 'Content-Type': 'application/soap+xml; charset=utf-8' },
            body: ERB.new(File.read('app/services/kps/private/templates/sts_request.erb')).result(binding)
          )
        end
      end
    end
  end
end
