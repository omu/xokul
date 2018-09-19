# frozen_string_literal: true

module Services
  module Yoksis
    class References
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'

      ARGS.each_key do |method|
        define_method method do
          @reference = client.request(ARGS.dig(method, :operation))

          raise InvalidResponseError if reference_has_error? method
          raise NoContentError unless reference_has_response? method
          reference_result method
        end
      end

      def districts(city_code:)
        @reference = client.request(
          ARGS.dig(:districts, :operation), args: { ILKODU: city_code }
        )

        raise InvalidResponseError if reference_has_error? :districts
        raise NoContentError unless reference_has_response? :districts
        reference_result :districts
      end

      private

      def reference_has_error?(method)
        @reference.dig(*ARGS.dig(method, :status)) != 'Başarılı'
      end

      def reference_has_response?(method)
        @reference.dig(*ARGS.dig(method, :result), &:present?)
      end

      def reference_result(method)
        @reference.dig(*ARGS.dig(method, :result))
      end
    end
  end
end
