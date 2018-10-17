# frozen_string_literal: true

module Yoksis
  module Graduates
    class InformationsSerializer < Serializer
      attribute(:diploma_grade)          { float   object[:diploma_notu]                           }
      attribute(:diploma_grading_system) { integer object[:diploma_not_sistemi]                    }
      attribute(:diploma_no)             { string  object[:diploma_no], ->(p) { p.upcase :turkic } }
      attribute(:faculty)                { string  object[:fak_myo_yo_ens]                         }
      attribute(:fathers_name)           { string  object[:baba_adi]                               }
      attribute(:first_name)             { string  object[:adi]                                    }
      attribute(:id_number)              { integer object[:tckno]                                  }
      attribute(:last_name)              { string  object[:soyadi]                                 }
      attribute(:mothers_name)           { string  object[:anne_adi]                               }
      attribute(:program)                { string  object[:program_adi]                            }
      attribute(:unit_id)                { integer object[:birim_id]                               }
      attribute(:university_id)          { integer object[:univ_id]                                }
      attribute(:university_name)        { string  object[:universite_adi]                         }

      attribute :date_of_birth do
        next unless object[:dogum_tarihi]

        year, month, day = object[:dogum_tarihi].values_at :yil, :ay, :gun
        build_date year, month, day
      end

      attribute :date_of_graduation do
        next unless object[:mezuniyet_tarihi]

        year, month, day = object[:mezuniyet_tarihi].values_at :yil, :ay, :gun
        build_date year, month, day
      end
    end
  end
end
