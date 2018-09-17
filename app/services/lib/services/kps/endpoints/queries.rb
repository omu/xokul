# frozen_string_literal: true

module Services
  module Kps
    class Queries
      WSDL_URL = ENV['KPS_PRIVATE_WSDL_URL'].freeze

      def addresses(id_number:)
        safe_request(
          __method__,
          args: { KimlikNo: id_number }
        )
      end

      def identities(id_number:)
        safe_request(
          __method__,
          args: { KimlikNo: id_number }
        )
      end
    end
  end
end
