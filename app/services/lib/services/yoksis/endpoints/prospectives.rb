# frozen_string_literal: true

module Services
  module Yoksis
    class Prospectives
      PLACEMENT_ENDPOINT = 'https://servisler.yok.gov.tr/rest/obs/yerlestirmeveri'
      PHOTO_ENDPOINT = 'https://servisler.yok.gov.tr/rest/obs/fotografindir'

      def initialize(username, password)
        @username = username
        @password = password
      end

      def students(type:, year:, online: nil, page: 0, per_page: 1000)
        q = "?tur=#{type}&yil=#{year}&page=#{page}&size=#{per_page}"
        q += "&ekayitOlanlar=#{online}" unless online.nil?

        request(
          PLACEMENT_ENDPOINT, query_string: q
        )
      end

      def student(id_number, type, year)
        request(
          PLACEMENT_ENDPOINT, query_string: "?tcKimlikNo=#{id_number}&tur=#{type}&yil=#{year}"
        )
      end

      def photo(id_number)
        r = request(
          PHOTO_ENDPOINT, query_string: "?tcKimlikNo=#{id_number}", skip_decode: true
        )
        Base64.strict_encode64(r)
      end

      private

      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/AbcSize
      def request(url, query_string: nil, skip_decode: false)
        uri     = URI "#{url}#{query_string}"
        request = Net::HTTP::Get.new(uri)
        request.basic_auth @username, @password

        http = new_http_object uri
        case response = http.request(request)
        when Net::HTTPOK
          raise NoContentError unless response.body

          return response.body if skip_decode

          r = (JSON.parse response.body).deep_symbolize_keys
          headers = {
            'current-page': r[:number],
            'page-items':   r[:numberOfElements],
            'total-pages':  r[:totalPages],
            'total-count':  r[:totalElements]
          }
          [r[:content], headers]
        else
          raise Error, response.body.force_encoding('utf-8').tr('"', '')
        end
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize

      def new_http_object(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http
      end
    end
  end
end
