# frozen_string_literal: true

require 'base64'

module Services
  module Yoksis
    # This class will definitely be rewritten in the future.
    class Military
      MILITARY_STATUS_ENDPOINT = 'https://servisler.yok.gov.tr/rest/obs/askerlikdurumsorgula'

      def initialize(username, password)
        @encoded_auth_token = Base64.encode64("#{username}:#{password}").chop
      end

      def informations(id_number:)
        url = MILITARY_STATUS_ENDPOINT + "?tcKimlikNo=#{id_number}"
        response = RestClient.get(
          url,
          header: { Authorization: "Basic #{@encoded_auth_token}" },
          use_ssl: true
        )

        raise InvalidResponseError unless response.ok?
        raise NoContentError unless response.body

        response.decode.deep_symbolize_keys
      end
    end
  end
end
