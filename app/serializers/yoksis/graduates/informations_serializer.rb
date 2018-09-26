# frozen_string_literal: true

module Yoksis
  module Graduates
    class InformationsSerializer < Serializer
      attribute(:id_number)              { object[:tckno].safe_to_i               }
      attribute(:first_name)             { object[:adi].titleize_tr               }
      attribute(:last_name)              { object[:soyadi].titleize_tr            }
      attribute(:fathers_name)           { object[:baba_adi].titleize_tr          }
      attribute(:mothers_name)           { object[:anne_adi].titleize_tr          }
      attribute(:diploma_grade)          { object[:diploma_notu].safe_to_f        }
      attribute(:diploma_grading_system) { object[:diploma_not_sistemi].safe_to_i }
      attribute(:diploma_no)             { object[:diploma_no]                    }
      attribute(:university_id)          { object[:univ_id].safe_to_i             }
      attribute(:university_name)        { object[:universite_adi].titleize_tr    }
      attribute(:faculty)                { object[:fak_myo_yo_ens].titleize_tr    }
      attribute(:program_name)           { object[:program_adi].titleize_tr       }
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