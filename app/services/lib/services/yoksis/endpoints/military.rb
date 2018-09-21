# frozen_string_literal: true

module Services
  module Yoksis
    class Military
      MILITARY_STATUS_ENDPOINT = 'https://servisler.yok.gov.tr/rest/obs/askerlikdurumsorgula'

      def initialize(username, password)
        @username = username
        @password = password
      end

      def informations(id_number:)
        request(
          MILITARY_STATUS_ENDPOINT, query_string: "?tcKimlikNo=#{id_number}"
        )
      end

      private

      # rubocop:disable Metrics/MethodLength
      def request(url, query_string: nil)
        uri     = URI "#{url}#{query_string}"
        request = Net::HTTP::Get.new(uri)
        request.basic_auth @username, @password

        http = new_http_object uri
        case response = http.request(request)
        when Net::HTTPOK
          raise NoContentError unless response.body

          (JSON.parse response.body).deep_symbolize_keys
        else
          raise InvalidResponseError
        end
      end
      # rubocop:enable Metrics/MethodLength

      def new_http_object(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http
      end
    end
  end
end
