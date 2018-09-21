# frozen_string_literal: true

module Services
  module Yoksis
    class Units
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'

      def changes(day:, month:, year:)
        @changes = client.request(
          ARGS.dig(:changes, :operation),
          args: { GUN: day, AY: month, YIL: year }
        )

        raise InvalidResponseError if changes_has_error?
        raise NoContentError unless changes_has_response?

        changes_result
      end

      def units(unit_id:)
        @units = client.request(
          ARGS.dig(:units, :operation), args: { BIRIM_ID: unit_id }
        )

        raise InvalidResponseError if units_has_error?
        raise NoContentError unless units_has_response?

        units_result
      end

      def universities
        @universities = client.request(*ARGS.dig(:universities, :operation))

        raise InvalidResponseError if universities_has_error?
        raise NoContentError unless universities_has_response?

        universities_result
      end

      def programs(unit_id:)
        @programs = client.request(
          ARGS.dig(:programs, :operation), args: { BIRIM_ID: unit_id }
        )

        raise InvalidResponseError if programs_has_error?
        raise NoContentError unless programs_has_response?

        programs_result
      end

      def subunits(unit_id:)
        @subunits = client.request(
          ARGS.dig(:subunits, :operation), args: { BIRIM_ID: unit_id }
        )

        raise InvalidResponseError if subunits_has_error?
        raise NoContentError unless subunits_has_response?

        subunits_result
      end

      private

      def changes_has_error?
        @changes.dig(*ARGS.dig(:changes, :status)) != 'Başarılı'
      end

      def changes_has_response?
        unit = [@changes.dig(*ARGS.dig(:changes, :result))].flatten.first
        unit[:birim_id].present?
      end

      def changes_result
        @changes.dig(*ARGS.dig(:changes, :result))
      end

      def units_has_error?
        @units.dig(*ARGS.dig(:units, :status)) != 'Başarılı'
      end

      def units_has_response?
        unit = [@units.dig(*ARGS.dig(:units, :result))].flatten.first
        unit[:birim].present?
      end

      def units_result
        @units.dig(*ARGS.dig(:units, :result))
      end

      def universities_has_error?
        @universities.dig(*ARGS.dig(:universities, :status)) != 'Başarılı'
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
        @programs.dig(*ARGS.dig(:programs, :status)) != 'Başarılı'
      end

      def programs_has_response?
        program = [@programs.dig(*ARGS.dig(:programs, :result))].flatten.first
        program[:birim].present?
      end

      def programs_result
        @programs.dig(*ARGS.dig(:programs, :result))
      end

      def subunits_has_error?
        @subunits.dig(*ARGS.dig(:subunits, :status)) != 'Başarılı'
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
