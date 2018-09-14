# frozen_string_literal: true

module Yoksis
  module Graduates
    class InformationsSerializer < Serializer
      attribute(:id_number)              { object[:tckno].safe_to_i               }
      attribute(:first_name)             { object[:adi]                           }
      attribute(:last_name)              { object[:soyadi]                        }
      attribute(:father_name)            { object[:baba_adi]                      }
      attribute(:mother_name)            { object[:anne_adi]                      }
      attribute(:diploma_grade)          { object[:diploma_notu].safe_to_f        }
      attribute(:diploma_grading_system) { object[:diploma_not_sistemi].safe_to_i }
      attribute(:diploma_no)             { object[:diploma_no]                    }
      attribute(:university_id)          { object[:univ_id].safe_to_i             }
      attribute(:university_name)        { object[:universite_adi]                }
      attribute(:faculty)                { object[:fak_myo_yo_ens]                }
      attribute(:program_name)           { object[:program_adi]                   }
      attribute(:unit_id)                { object[:birim_id].safe_to_i            }

      attribute :date_of_birth do
        next unless object[:dogum_tarihi]
        build_date(*object[:dogum_tarihi].values_at(:yil, :ay, :gun))
      end

      attribute :date_of_graduation do
        next unless object[:mezuniyet_tarihi]
        build_date(*object[:mezuniyet_tarihi].values_at(:yil, :ay, :gun))
      end
    end
  end
end