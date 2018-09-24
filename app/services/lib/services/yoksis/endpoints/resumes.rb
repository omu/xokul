# frozen_string_literal: true

module Services
  module Yoksis
    class Resumes
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'

      def citations(id_number:, year:)
        @citations = client.request(
          ARGS.dig(:citations, :operation),
          args: params_with_defaults(P_TC_KIMLIK_NO: id_number, P_DONEM: year)
        )

        raise InvalidResponseError if citations_has_error?
        raise NoContentError unless citations_has_response?

        citations_result
      end

      def papers(id_number:, year:, month:, day:)
        @papers = client.request(
          ARGS.dig(:papers, :operation),
          args: params_with_defaults(
            P_TC_KIMLIK_NO: id_number, P_TARIH: "#{year}-#{month}-#{day}"
          )
        )

        raise InvalidResponseError if papers_has_error?
        raise NoContentError unless papers_has_response?

        papers_result
      end

      def articles(id_number:)
        @resumes = client.request(
          ARGS.dig(__callee__, :operation),
          args: params_with_defaults(P_TC_KIMLIK_NO: id_number)
        )

        raise InvalidResponseError if resumes_has_error? __callee__
        raise NoContentError unless resumes_has_response? __callee__

        resumes_result __callee__
      end

      alias certifications articles
      alias projects articles

      private

      # TODO: Refactor the error and response handling in the future. Because
      # there are too many repetitive code blocks.

      def resumes_has_error?(method)
        @resumes.dig(*ARGS.dig(method, :status)) { |data| data.to_i.zero? }
      end

      def resumes_has_response?(method)
        @resumes.dig(*ARGS.dig(method, :result), &:present?)
      end

      def resumes_result(method)
        @resumes.dig(*ARGS.dig(method, :result))
      end

      def citations_has_error?
        @citations.dig(*ARGS.dig(:citations, :status)) { |data| data.to_i.zero? }
      end

      def citations_has_response?
        @citations.dig(*ARGS.dig(:citations, :result), &:present?)
      end

      def citations_result
        @citations.dig(*ARGS.dig(:citations, :result))
      end

      def papers_has_error?
        @papers.dig(*ARGS.dig(:papers, :status)) { |data| data.to_i.zero? }
      end

      def papers_has_response?
        @papers.dig(*ARGS.dig(:papers, :result), &:present?)
      end

      def papers_result
        @papers.dig(*ARGS.dig(:papers, :result))
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
