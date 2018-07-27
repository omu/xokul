# frozen_string_literal: true

module Services
  module Kps
    module Private
      class Template
        # WIP
        ROOT_PATH = 'app/services/kps/private'
        private_constant :ROOT_PATH

        def initialize(partial)
          path, file = File.split(partial)
          @filepath = File.join(ROOT_PATH, path, "_#{file}.erb")
        end

        def compile
          ERB.new(raw).result(binding)
        end

        private

        # WIP
        def raw
          raise StandardError, 'template file does not exist!' unless File.exist?(@filepath)
          File.read(@filepath)
        end
      end
    end
  end
end
