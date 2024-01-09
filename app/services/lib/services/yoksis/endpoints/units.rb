# frozen_string_literal: true

module Services
  module Yoksis
    class Units
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/yuksekogretim/egitim?wsdl'

      def changes(day:, month:, year:)
        @changes = client.request(
          ARGS.dig(:changes, :operation),
          args: { GUN: day, AY: month, YIL: year }
        )

        raise InvalidResponseError if changes_has_error?
        raise NoContentError unless changes_has_response?

        changes_result
      end

      def names(unit_id:)
        @names = client.request(
          ARGS.dig(:names, :operation), args: { BirimId: unit_id }
        )

        raise InvalidResponseError if names_has_error?
        raise NoContentError unless names_has_response?

        names_result
      end

      def universities
        @universities = client.request(*ARGS.dig(:universities, :operation))

        raise InvalidResponseError if universities_has_error?
        raise NoContentError unless universities_has_response?

        [universities_result].flatten
      end

      def programs(unit_id:)
        @programs = client.request(
          ARGS.dig(:programs, :operation), args: { BirimId: unit_id }
        )

        raise InvalidResponseError if programs_has_error?
        raise NoContentError unless programs_has_response?

        [programs_result].flatten
      end

      def subunits(unit_id:)
        @subunits = client.request(
          ARGS.dig(:subunits, :operation), args: { BirimId: unit_id }
        )

        raise InvalidResponseError if subunits_has_error?
        raise NoContentError unless subunits_has_response?

        [subunits_result].flatten
      end

      private

      def changes_has_error?
        @changes.dig(*ARGS.dig(:changes, :status)) != '1'
      end

      def changes_has_response?
        unit = [@changes.dig(*ARGS.dig(:changes, :result))].flatten.first
        unit[:birim_id].present?
      end

      def changes_result
        @changes.dig(*ARGS.dig(:changes, :result))
      end

      def names_has_error?
        @names.dig(*ARGS.dig(:names, :status)) != '1'
      end

      def names_has_response?
        unit = [@names.dig(*ARGS.dig(:names, :result))].flatten.first
        unit[:birim].present?
      end

      def names_result
        @names.dig(*ARGS.dig(:names, :result))
      end

      def universities_has_error?
        @universities.dig(*ARGS.dig(:universities, :status)) != '1'
      end

      def universities_has_response?
        university = [
          @universities.dig(*ARGS.dig(:universities, :result))
        ].flatten.first
        university[:birim_id].present?
      end

      def universities_result
        @universities.dig(*ARGS.dig(:universities, :result))
      end

      def programs_has_error?
        @programs.dig(*ARGS.dig(:programs, :status)) != '1'
      end

      def programs_has_response?
        program = [@programs.dig(*ARGS.dig(:programs, :result))].flatten.first
        program[:birim].present?
      end

      def programs_result
        @programs.dig(*ARGS.dig(:programs, :result))
      end

      def subunits_has_error?
        @subunits.dig(*ARGS.dig(:subunits, :status)) != '1'
      end

      def subunits_has_response?
        subunit = [@subunits.dig(*ARGS.dig(:subunits, :result))].flatten.first
        subunit[:bagli_oldugu_birim_id].present?
      end

      def subunits_result
        @subunits.dig(*ARGS.dig(:subunits, :result))
      end
    end
  end
end
