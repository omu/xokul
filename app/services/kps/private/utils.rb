# frozen_string_literal: true

module Services
  module Kps
    class Private
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
          ERB.new(file).result(binding)
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
