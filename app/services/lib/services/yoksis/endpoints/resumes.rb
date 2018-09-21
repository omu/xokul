# frozen_string_literal: true

module Services
  module Yoksis
    class Resumes
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'

      # rubocop:disable Metrics/MethodLength
      def articles(username:, password:, id_number:)
        @resumes = client.request(
          ARGS.dig(__callee__, :operation),
          args: {
            parametre: {
              P_KULLANICI_ID: username,
              P_SIFRE: password,
              P_TC_KIMLIK_NO: id_number
            }
          }
        )

        raise InvalidResponseError if resumes_has_error? __callee__
        raise NoContentError unless resumes_has_response? __callee__

        resumes_result __callee__
      end
      # rubocop:enable Metrics/MethodLength

      alias certifications articles
      alias projects articles

      private

      def resumes_has_error?(method)
        @resumes.dig(*ARGS.dig(method, :status)) { |data| data.to_i.zero? }
      end

      def resumes_has_response?(method)
        @resumes.dig(*ARGS.dig(method, :result), &:present?)
      end

      def resumes_result(method)
        @resumes.dig(*ARGS.dig(method, :result))
      end
    end
  end
end
