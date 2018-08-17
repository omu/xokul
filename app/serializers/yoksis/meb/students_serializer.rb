# frozen_string_literal: true

module Yoksis
  module Meb
    class StudentsSerializer < Serializer
      attribute(:id_number)           { object[:tckimlikno].try(:to_i)                   }
      attribute(:first_name)          { object[:adi]                                     }
      attribute(:last_name)           { object[:soyadi]                                  }
      attribute(:school_id)           { object[:okulkodu].try(:to_i)                     }
      attribute(:school_name)         { object[:okuladi]                                 }
      attribute(:school_field_code)   { object[:okulalankodu].try(:to_i)                 }
      attribute(:school_field_name)   { object[:okulalanadi]                             }
      attribute(:school_branch_code)  { object[:okuldalkodu].try(:to_i)                  }
      attribute(:school_branch_name)  { object[:okuldaladi]                              }
      attribute(:top_scoring_student) { object[:okulbirincisi].to_i.zero? ? false : true }
      attribute(:city_name)           { object[:okuliladi]                               }
      attribute(:city_code)           { object[:okulilkodu].try(:to_i)                   }
      attribute(:district_name)       { object[:okulilceadi]                             }
      attribute(:district_code)       { object[:okulilcekodu].try(:to_i)                 }
      attribute(:instruction_type)    { object[:ogrenimturu]                             }
      attribute(:grad_status_code)    { object[:mezundurumukodu].try(:to_i)              }
      attribute(:grad_status)         { object[:mezundurumu]                             }
      attribute(:graduation_date)     { object[:mezuniyettarih]                          }
      attribute(:grading_system)      { object[:notsistemi].try(:to_i)                   }
      attribute(:diploma_grade)       { object[:diplomanotupuani].tr(',', '.').to_f      }
    end
  end
end
