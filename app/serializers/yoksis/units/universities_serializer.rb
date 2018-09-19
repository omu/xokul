# frozen_string_literal: true

module Yoksis
  module Units
    class UniversitiesSerializer < Serializer
      attribute(:unit_id)      { object[:birim_id].safe_to_i  }
      attribute(:name)         { object[:birim_adi]           }
      attribute(:english_name) { object[:birim_adi_ingilizce] }
      attribute(:phone)        { object[:telefon]             }
      attribute(:fax)          { object[:faks]                }
      attribute(:address)      { object[:adres]               }
      attribute(:website)      { object[:web]                 }
      attribute(:email)        { object[:eposta]              }

      attribute :university_type do
        {
          code: object.dig(:universite_turu, :kod).safe_to_i,
          name: object.dig(:universite_turu, :ad)
        }
      end

      attribute :status do
        {
          code: object.dig(:aktiflik, :kod).safe_to_i,
          name: object.dig(:aktiflik, :ad)
        }
      end

      attribute :city do
        {
          code: object.dig(:il, :kod).safe_to_i,
          name: object.dig(:il, :ad)
        }
      end

      attribute :district do
        {
          code: object.dig(:ilce, :kod).safe_to_i,
          name: object.dig(:ilce, :ad)
        }
      end

      attribute :big_city do
        {
          code: object.dig(:buyuksehir, :kod).safe_to_i,
          name: object.dig(:buyuksehir, :ad)
        }
      end

      attribute :seaside do
        {
          code: object.dig(:deniz_kiyisi, :kod).safe_to_i,
          name: object.dig(:deniz_kiyisi, :ad)
        }
      end
    end
  end
end
