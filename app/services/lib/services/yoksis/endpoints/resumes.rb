# frozen_string_literal: true

module Services
  module Yoksis
    class Resumes
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'

      def articles(id_number:)
        @resumes = client.request(
          ARGS.dig(__callee__, :operation),
          args: params_with_defaults(P_TC_KIMLIK_NO: id_number)
        )

        raise InvalidResponseError if resumes_has_error? __callee__
        raise NoContentError unless resumes_has_response? __callee__

        resumes_result __callee__
      end

      def citations(id_number:, year:)
        @resumes = client.request(
          ARGS.dig(:citations, :operation),
          args: params_with_defaults(P_TC_KIMLIK_NO: id_number, P_DONEM: year)
        )

        raise InvalidResponseError if resumes_has_error? __method__
        raise NoContentError unless resumes_has_response? __method__

        resumes_result __method__
      end

      alias academic_duties       articles
      alias administrative_duties articles
      alias awards                articles
      alias books                 articles
      alias certifications        articles
      alias editorships           articles
      alias foreign_languages     articles
      alias lectures              articles
      alias memberships           articles
      alias other_experiences     articles
      alias papers                articles
      alias patents               articles
      alias projects              articles
      alias refereeing            articles
      alias thesis_advisors       articles

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

      def params_with_defaults(**params)
        {
          parametre: {
            P_KULLANICI_ID: @username, P_SIFRE: @password
          }.merge(params)
        }
      end

      protected

      def after_initialize
        @username, @password = @options[:basic_auth]
      end
    end
  end
end
