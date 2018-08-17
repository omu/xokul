# frozen_string_literal: true

module Yoksis
  module Students
    class PersonalInformationsSerializer < Serializer
      attribute(:id_number)     { object[:tc_kimlik_no].try(:to_i) }
      attribute(:first_name)    { object[:adi] }
      attribute(:last_name)     { object[:soyadi] }
      attribute(:father_name)   { object[:baba_adi] }
      attribute(:mother_name)   { object[:anne_adi] }
      attribute(:date_of_birth) do
        build_date(*object[:dogum_tarihi].values_at(:yil, :ay, :gun))
      end
      attribute(:nationality) do
        {
          code: object.dig(:uyrugu, :kod).try(:to_i),
          name: object.dig(:uyrugu, :ad)
        }
      end
      attribute(:gender) do
        {
          code: object.dig(:cinsiyeti, :kod).try(:to_i),
          name: object.dig(:cinsiyeti, :ad)
        }
      end
    end
  end
end
