# frozen_string_literal: true

module Services
  module Yoksis
    class MEB
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/mebmezunsorgulav2?WSDL'

      def students(id_number:, service_password: nil)
        @students = client.request(
          ARGS.dig(:students, :operation),
          args: { TCKIMLIKNO: id_number, ServicePassWord: service_password }
        )

        raise InvalidResponseError if students_has_error?
        raise NoContentError unless students_has_response?

        students_result
      end

      private

      def students_has_response?
        @students.dig(*ARGS.dig(:students, :result), &:present?)
      end

      def students_has_error?
        @students.dig(*ARGS.dig(:students, :status)) { |data| data.to_i.zero? }
      end

      def students_result
        @students.dig(*ARGS.dig(:students, :result))
      end

      protected

      def after_initialize
        client.configure { |config| config.soap_version 2 }
      end
    end
  end
end
