# frozen_string_literal: true

module Yoksis
  module Graduations
    class StudentsSerializer < Serializer
      attribute(:id_number)              { object[:tckno].try(:to_i) }
      attribute(:first_name)             { object[:adi]              }
      attribute(:last_name)              { object[:soyadi]           }
      attribute(:father_name)            { object[:baba_adi]         }
      attribute(:mother_name)            { object[:anne_adi]         }
      attribute(:date_of_birth)          { build_date(*object[:dogum_tarihi].values_at(:yil, :ay, :gun))     }
      attribute(:date_of_graduation)     { build_date(*object[:mezuniyet_tarihi].values_at(:yil, :ay, :gun)) }
      attribute(:diploma_grade)          { object[:diploma_notu].try(:to_i)        }
      attribute(:diploma_grading_system) { object[:diploma_not_sistemi].try(:to_i) }
      attribute(:diploma_no)             { object[:diploma_no]                     }
      attribute(:university_id)          { object[:univ_id].try(:to_i)             }
      attribute(:university_name)        { object[:universite_adi]                 }
      attribute(:faculty)                { object[:fak_myo_yo_ens]                 }
      attribute(:program_name)           { object[:program_adi]                    }
      attribute(:unit_id)                { object[:birim_id].try(:to_i)            }
    end
  end
end
