# frozen_string_literal: true

module Services
  module Yoksis
    class References
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'
      TERM_TYPES_ENDPOINT = 'http://servisler.yok.gov.tr/rest/schema/donemTur'

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

      def term_types
        xpath = %w[schema simpleType restriction enumeration]
        parser = Nori.new(delete_namespace_attributes: true, strip_namespaces: true)
        response = RestClient.get(TERM_TYPES_ENDPOINT)
        collection = parser.parse(response.body).dig(*xpath)
        collection.map { |object| object.values }.flatten
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
