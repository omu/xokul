# frozen_string_literal: true

module Yoksis
  module Units
    class ChangesSerializer < Serializer
      attribute(:unit_id)        { integer        object[:birim_id]              }
      attribute(:unit_name)      { string         object[:birim_adi]             }
      attribute(:parent_unit_id) { string         object[:bagli_oldugu_birim_id] }
      attribute(:date_of_update) { parse_datetime object[:degisiklik_tarihi]     }

      attribute :unit_type do
        {
          code: integer(object.dig(:birim_turu, :kod)),
          name: string(object.dig(:birim_turu, :ad))
        }
      end

      attribute :status do
        {
          code: integer(object.dig(:aktiflik, :kod)),
          name: string(object.dig(:aktiflik, :ad))
        }
      end

      attribute :change_type do
        {
          code: integer(object.dig(:degisiklik_turu, :kod)),
          name: string(object.dig(:degisiklik_turu, :ad))
        }
      end
    end
  end
end
