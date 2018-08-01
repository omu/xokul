# frozen_string_literal: true

module Services
  module Kps
    module Private
      module Utils
        TIME_FORMAT = "%Y-%m-%d\T%H:%M:%S\Z"
        private_constant :TIME_FORMAT

        def self.timestamp(duration = 0)
          (Time.zone.now + duration).strftime(TIME_FORMAT)
        end

        def self.http_get(url, header: {}, body:)
          uri = URI.parse(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          req = Net::HTTP::Get.new(uri.path, header)
          req.body = body
          http.request(req)
        end
      end
    end
  end
end
