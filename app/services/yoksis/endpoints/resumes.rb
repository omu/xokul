# frozen_string_literal: true

module Services
  module Yoksis
    class Resumes
      WSDL_URL = 'http://servisler.yok.gov.tr/ws/ozgecmisv1?WSDL'

      UNDEFINABLE_METHODS_IN_ITERATION = %i[
        authors
        citations
        incentive_applications
        incentive_activity_declarations
      ].freeze
      private_constant :UNDEFINABLE_METHODS_IN_ITERATION

      ARGS.each_key do |method|
        define_method method do |id_number:|
          next if method.in?(UNDEFINABLE_METHODS_IN_ITERATION)

          @resumes = client.request(
            ARGS.dig(method, :operation),
            args: params_with_defaults(P_TC_KIMLIK_NO: id_number)
          )

          raise InvalidResponseError if resumes_has_error? method
          raise NoContentError unless resumes_has_response? method

          resumes_result method
        end
      end

      def authors(id_number:, author_id:)
        @resumes = client.request(
          ARGS.dig(__method__, :operation),
          args: params_with_defaults(
            P_TC_KIMLIK_NO: id_number, P_YAZAR_ID: author_id
          )
        )

        raise InvalidResponseError if resumes_has_error? __method__
        raise NoContentError unless resumes_has_response? __method__

        resumes_result __method__
      end

      def citations(id_number:, year:)
        @resumes = client.request(
          ARGS.dig(__callee__, :operation),
          args: params_with_defaults(P_TC_KIMLIK_NO: id_number, P_DONEM: year)
        )

        raise InvalidResponseError if resumes_has_error? __callee__
        raise NoContentError unless resumes_has_response? __callee__

        resumes_result __callee__
      end

      alias incentive_applications citations
      alias incentive_activity_declarations citations

      private

      def resumes_has_error?(method)
        @resumes.dig(*ARGS.dig(method, :status)) { |data| data.to_i.zero? }
      end

      def resumes_has_response?(method)
        @resumes.dig(*ARGS.dig(method, :result), &:present?)
      end

      def resumes_result(method)
        result = @resumes.dig(*ARGS.dig(method, :result))
        [result].flatten
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
