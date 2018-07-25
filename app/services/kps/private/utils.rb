# frozen_string_literal: true

module Services
  module Kps
    module Private
      module Utils
        TIME_FORMAT = "%Y-%m-%d\T%H:%M:%S\Z"
        private_constant :TIME_FORMAT

        def self.created_time
          Time.now.utc.strftime(TIME_FORMAT)
        end

        def self.expires_time(duration = 600)
          (Time.now + duration).utc.strftime(TIME_FORMAT)
        end

        def self.erb(file)
          ERB.new(File.read(file)).result(binding)
        end

        def self.http_get(url, header: {}, body: nil)
          uri = URI.parse(url)
          http = Net::HTTP.new(uri.host, uri.port)
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_PEER
          req = Net::HTTP::Get.new(uri.path, header)
          req.body = body
          http.request(req)
        end

        # Workaround
        def self.uuid
          require 'securerandom' if defined?(SecureRandom)
          SecureRandom.uuid
        end
      end
    end
  end
end
