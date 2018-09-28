# frozen_string_literal: true

module Yoksis
  module Meb
    class StudentsSerializer < Serializer
      attribute(:id_number)           { integer object[:tckimlikno]                        }
      attribute(:first_name)          { string  object[:adi],            method: :titleize }
      attribute(:last_name)           { string  object[:soyadi],         method: :titleize }
      attribute(:school_id)           { integer object[:okulkodu]                          }
      attribute(:school_name)         { string  object[:okuladi],        method: :titleize }
      attribute(:school_field_code)   { integer object[:okulalankodu]                      }
      attribute(:school_field_name)   { string  object[:okulalanadi],    method: :titleize }
      attribute(:school_branch_code)  { integer object[:okuldalkodu]                       }
      attribute(:school_branch_name)  { string  object[:okuldaladi],     method: :titleize }
      attribute(:city_name)           { string  object[:okuliladi],      method: :titleize }
      attribute(:city_code)           { integer object[:okulilkodu]                        }
      attribute(:district_name)       { string  object[:okulilceadi],    method: :titleize }
      attribute(:district_code)       { integer object[:okulilcekodu]                      }
      attribute(:instruction_type)    { string  object[:ogrenimturu],    method: :titleize }
      attribute(:grad_status_code)    { integer object[:mezundurumukodu]                   }
      attribute(:grad_status)         { string  object[:mezundurumu],    method: :titleize }
      attribute(:graduation_date)     { date    object[:mezuniyettarih]                    }
      attribute(:grading_system)      { integer object[:notsistemi]                        }
      attribute(:diploma_grade)       { float   object[:diplomanotupuani]                  }

      attribute :top_scoring_student do
        object[:okulbirincisi] && !object[:okulbirincisi].to_i.zero?
      end
    end
  end
end