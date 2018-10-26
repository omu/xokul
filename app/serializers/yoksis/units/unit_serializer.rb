# frozen_string_literal: true

module Yoksis
  module Units
    class UnitSerializer < Serializer
      attribute(:english_name)    { string  object[:birim_adi_ingilizce], ->(p) { p.titleize }, case_conversion: false }
      attribute(:long_name)       { string  object[:birim_uzun_adi]                                                    }
      attribute(:osym_id)         { integer object[:kilavuz_kodu]                                                      }
      attribute(:parent_unit_id)  { integer object[:bagli_oldugu_birim_id]                                             }
      attribute(:period_of_study) { integer object[:ogrenim_suresi]                                                    }

      attribute :city do
        {
          code: integer(object.dig(:il, :kod)),
          name: string(object.dig(:il, :ad))
        }
      end

      attribute :district do
        {
          code: integer(object.dig(:ilce, :kod)),
          name: string(object.dig(:ilce, :ad))
        }
      end

      attribute :faculty do
        {
          code: integer(object.dig(:fakulte_yo_myo_enstitu, :kod)),
          name: string(object.dig(:fakulte_yo_myo_enstitu, :ad))
        }
      end

      attribute :instruction_language do
        {
          code: integer(object.dig(:ogrenim_dili, :kod)),
          name: string(object.dig(:ogrenim_dili, :ad))
        }
      end

      attribute :instruction_type do
        {
          code: integer(object.dig(:ogrenim_turu, :kod)),
          name: string(object.dig(:ogrenim_turu, :ad))
        }
      end

      attribute :status do
        {
          code: integer(object.dig(:aktiflik, :kod)),
          name: string(object.dig(:aktiflik, :ad))
        }
      end

      attribute :unit do
        {
          code: integer(object.dig(:birim, :kod)),
          name: string(object.dig(:birim, :ad))
        }
      end

      attribute :unit_type do
        {
          code: integer(object.dig(:birim_turu, :kod)),
          name: string(object.dig(:birim_turu, :ad))
        }
      end

      attribute :university do
        {
          code: integer(object.dig(:universite, :kod)),
          name: string(object.dig(:universite, :ad))
        }
      end

      attribute :university_type do
        {
          code: integer(object.dig(:universite_turu, :kod)),
          name: string(object.dig(:universite_turu, :ad))
        }
      end
    end
  end
end
