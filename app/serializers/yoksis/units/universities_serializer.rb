# frozen_string_literal: true

module Yoksis
  module Units
    class UniversitiesSerializer < Serializer
      attribute(:address)      { string  object[:adres]                                                             }
      attribute(:email)        { string  object[:eposta]                                                            }
      attribute(:english_name) { string  object[:birim_ingilizce_adi], ->(p) { p.titleize }, case_conversion: false }
      attribute(:fax)          { string  object[:faks]                                                              }
      attribute(:name)         { string  object[:birim_adi]                                                         }
      attribute(:phone)        { string  object[:telefon]                                                           }
      attribute(:unit_id)      { integer object[:birim_id]                                                          }
      attribute(:website)      { string  object[:web]                                                               }

      attribute :big_city do
        {
          code: integer(object.dig(:buyuksehir, :kod)),
          name: string(object.dig(:buyuksehir, :ad))
        }
      end

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

      attribute :seaside do
        {
          code: integer(object.dig(:deniz_kiyisi, :kod)),
          name: string(object.dig(:deniz_kiyisi, :ad))
        }
      end

      attribute :status do
        {
          code: integer(object.dig(:aktiflik, :kod)),
          name: string(object.dig(:aktiflik, :ad))
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
