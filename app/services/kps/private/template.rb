# frozen_string_literal: true

module Services
  module Kps
    module Private
      class Template
        def initialize(partial)
          path, file = File.split(partial)
          @filepath = File.join(__dir__, path, "_#{file}.erb")
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
