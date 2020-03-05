# frozen_string_literal: true

module Xokul
  module Client
    class Connection
      include Authentication

      attr_reader :http

      delegate :get, :post, :put, to: :@http

      def initialize
        @http = HTTP.use instrumenter: Configuration.instrumenter, namespace: 'xokul.http'
        @http.authenticate
      end
    end
  end
end
