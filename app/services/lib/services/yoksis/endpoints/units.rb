# frozen_string_literal: true

module Services
  module Yoksis
    class Units
      WSDL_URL = 'https://servisler.yok.gov.tr/ws/UniversiteBirimlerv4?WSDL'

      def changes(day:, month:, year:)
        safe_request(__method__, args: { GUN: day, AY: month, YIL: year })
      end

      def subunits(unit_id:)
        safe_request(__callee__, args: { BIRIM_ID: unit_id })
      end

      def universities
        safe_request(__method__)
      end

      alias programs subunits
    end
  end
end
