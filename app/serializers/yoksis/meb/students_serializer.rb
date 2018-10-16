# frozen_string_literal: true

module Yoksis
  module Meb
    class StudentsSerializer < Serializer
      attribute(:id_number)          { integer    object[:tckimlikno]      }
      attribute(:first_name)         { string     object[:adi]             }
      attribute(:last_name)          { string     object[:soyadi]          }
      attribute(:city_name)          { string     object[:okuliladi]       }
      attribute(:city_code)          { integer    object[:okulilkodu]      }
      attribute(:district_name)      { string     object[:okulilceadi]     }
      attribute(:district_code)      { integer    object[:okulilcekodu]    }
      attribute(:school_id)          { integer    object[:okulkodu]        }
      attribute(:school_name)        { string     object[:okuladi]         }
      attribute(:school_field_code)  { integer    object[:okulalankodu]    }
      attribute(:school_field_name)  { string     object[:okulalanadi]     }
      attribute(:school_branch_code) { integer    object[:okuldalkodu]     }
      attribute(:school_branch_name) { string     object[:okuldaladi]      }
      attribute(:instruction_type)   { string     object[:ogrenimturu]     }
      attribute(:grad_status_code)   { integer    object[:mezundurumukodu] }
      attribute(:grad_status_name)   { string     object[:mezundurumu]     }
      attribute(:graduation_date)    { parse_date object[:mezuniyettarih]  }
      attribute(:grading_system)     { integer    object[:notsistemi]      }

      attribute :top_scoring_student do
        object[:okulbirincisi] && !object[:okulbirincisi].to_i.zero?
      end
    end
  end
end