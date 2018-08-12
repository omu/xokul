# frozen_string_literal: true

module Yoksis
  module Meb
    class DetailedGraduationDataSerializer < ActiveModel::Serializer
      attribute(:id_number)           { object[:tckimlikno]       }
      attribute(:first_name)          { object[:adi]              }
      attribute(:last_name)           { object[:soyadi]           }
      attribute(:school_id)           { object[:okulkodu]         }
      attribute(:school_name)         { object[:okuladi]          }
      attribute(:school_field_code)   { object[:okulalankodu]     }
      attribute(:school_field_name)   { object[:okulalanadi]      }
      attribute(:school_branch_code)  { object[:okuldalkodu]      }
      attribute(:school_branch_name)  { object[:okuldaladi]       }
      attribute(:top_scoring_student) { object[:okulbirincisi]    }
      attribute(:city_name)           { object[:okuliladi]        }
      attribute(:city_code)           { object[:okulilkodu]       }
      attribute(:district_name)       { object[:okulilceadi]      }
      attribute(:district_code)       { object[:okulilcekodu]     }
      attribute(:instruction_type)    { object[:ogrenimturu]      }
      attribute(:grad_status_code)    { object[:mezundurumukodu]  }
      attribute(:grad_status)         { object[:mezundurumu]      }
      attribute(:graduation_date)     { object[:mezuniyettarih]   }
      attribute(:grading_system)      { object[:notsistemi]       }
      attribute(:diploma_grade)       { object[:diplomanotupuani] }
    end
  end
end
