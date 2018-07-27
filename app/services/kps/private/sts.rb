# frozen_string_literal: true

module Services
  module Kps
    module Private
      Sts = Struct.new(:username, :password, :url) do
        def token; end
      end
    end
  end
end
