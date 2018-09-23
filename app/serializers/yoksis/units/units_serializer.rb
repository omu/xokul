# frozen_string_literal: true

module Yoksis
  module Units
    class UnitsSerializer < Serializer
      attribute(:long_name)       { object.dig(:birim_uzun_adi).titleize_tr      }
      attribute(:english_name)    { object.dig(:birim_adi_ingilizce).titleize    }
      attribute(:parent_unit_id)  { object.dig(:bagli_oldugu_birim_id).safe_to_i }
      attribute(:period_of_study) { object.dig(:ogrenim_suresi).safe_to_i        }
      attribute(:osym_id)         { object.dig(:kilavuz_kodu).safe_to_i          }

      attribute :university do
        {
          code: object.dig(:universite, :kod).safe_to_i,
          name: object.dig(:universite, :ad).titleize_tr
        }
      end

      attribute :university_type do
        {
          code: object.dig(:universite_turu, :kod).safe_to_i,
          name: object.dig(:universite_turu, :ad).titleize_tr
        }
      end

      attribute :unit do
        {
          code: object.dig(:birim, :kod).safe_to_i,
          name: object.dig(:birim, :ad).titleize_tr
        }
      end

      attribute :unit_type do
        {
          code: object.dig(:birim_turu, :kod).safe_to_i,
          name: object.dig(:birim_turu, :ad).titleize_tr
        }
      end

      attribute :faculty do
        {
          code: object.dig(:fakulte_yo_myo_enstitu, :kod).safe_to_i,
          name: object.dig(:fakulte_yo_myo_enstitu, :ad).titleize_tr
        }
      end

      attribute :status do
        {
          code: object.dig(:aktiflik, :kod).safe_to_i,
          name: object.dig(:aktiflik, :ad).titleize_tr
        }
      end

      attribute :instruction_language do
        {
          code: object.dig(:ogrenim_dili, :kod).safe_to_i,
          name: object.dig(:ogrenim_dili, :ad).titleize_tr
        }
      end

      attribute :instruction_type do
        {
          code: object.dig(:ogrenim_turu, :kod).safe_to_i,
          name: object.dig(:ogrenim_turu, :ad).titleize_tr
        }
      end

      attribute :city do
        {
          code: object.dig(:il, :kod).safe_to_i,
          name: object.dig(:il, :ad).titleize_tr
        }
      end

      attribute :district do
        {
          code: object.dig(:ilce, :kod).safe_to_i,
          name: object.dig(:ilce, :ad).titleize_tr
        }
      end
    end
  end
end
