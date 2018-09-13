# frozen_string_literal: true

module Yoksis
  module Units
    class ChangesSerializer < Serializer
      attribute(:unit_id)            { object[:birim_id].safe_to_i              }
      attribute(:unit_name)          { object[:birim_adi]                       }
      attribute(:parent_unit_id)     { object[:bagli_oldugu_birim_id].safe_to_i }
      attribute(:last_modified_date) { object[:degisiklik_tarihi]               }

      attribute :unit_type do
        {
          code: object.dig(:birim_turu, :kod).safe_to_i,
          name: object.dig(:birim_turu, :ad)
        }
      end

      attribute :status do
        {
          code: object.dig(:aktiflik, :kod).safe_to_i,
          name: object.dig(:aktiflik, :ad)
        }
      end

      attribute :change_type do
        {
          code: object.dig(:degisiklik_turu, :kod).safe_to_i,
          name: object.dig(:degisiklik_turu, :ad)
        }
      end
    end
  end
end
