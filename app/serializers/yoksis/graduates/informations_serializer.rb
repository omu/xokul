# frozen_string_literal: :titleize

module Yoksis
  module Graduates
    class InformationsSerializer < Serializer
      attribute(:id_number)              { integer object[:tckno]                                 }
      attribute(:first_name)             { string  object[:adi],                method: :titleize }
      attribute(:last_name)              { string  object[:soyadi],             method: :titleize }
      attribute(:fathers_name)           { string  object[:baba_adi],           method: :titleize }
      attribute(:mothers_name)           { string  object[:anne_adi],           method: :titleize }
      attribute(:diploma_grade)          { float   object[:diploma_notu]                          }
      attribute(:diploma_grading_system) { integer object[:diploma_not_sistemi]                   }
      attribute(:diploma_no)             { string  object[:diploma_no],         method: :upcase   }
      attribute(:university_id)          { integer object[:univ_id]                               }
      attribute(:university_name)        { string  object[:universite_adi],     method: :titleize }
      attribute(:faculty)                { string  object[:fak_myo_yo_ens],     method: :titleize }
      attribute(:program)                { string  object[:program_adi],        method: :titleize }
      attribute(:unit_id)                { integer object[:birim_id]                              }

      attribute :date_of_birth do
        build_date(*object[:dogum_tarihi].values_at(:yil, :ay, :gun))
      end

      attribute :date_of_graduation do
        build_date(*object[:mezuniyet_tarihi].values_at(:yil, :ay, :gun))
      end
    end
  end
end