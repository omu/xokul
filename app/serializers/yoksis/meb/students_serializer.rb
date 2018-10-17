# frozen_string_literal: true

module Yoksis
  module Meb
    class StudentsSerializer < Serializer
      attribute(:city_code)          { integer    object[:okulilkodu]      }
      attribute(:city_name)          { string     object[:okuliladi]       }
      attribute(:district_code)      { integer    object[:okulilcekodu]    }
      attribute(:district_name)      { string     object[:okulilceadi]     }
      attribute(:first_name)         { string     object[:adi]             }
      attribute(:grad_status_code)   { integer    object[:mezundurumukodu] }
      attribute(:grad_status_name)   { string     object[:mezundurumu]     }
      attribute(:grading_system)     { integer    object[:notsistemi]      }
      attribute(:graduation_date)    { parse_date object[:mezuniyettarih]  }
      attribute(:id_number)          { integer    object[:tckimlikno]      }
      attribute(:instruction_type)   { string     object[:ogrenimturu]     }
      attribute(:last_name)          { string     object[:soyadi]          }
      attribute(:school_branch_code) { integer    object[:okuldalkodu]     }
      attribute(:school_branch_name) { string     object[:okuldaladi]      }
      attribute(:school_field_code)  { integer    object[:okulalankodu]    }
      attribute(:school_field_name)  { string     object[:okulalanadi]     }
      attribute(:school_id)          { integer    object[:okulkodu]        }
      attribute(:school_name)        { string     object[:okuladi]         }

      attribute :top_scoring_student do
        object[:okulbirincisi] && !object[:okulbirincisi].to_i.zero?
      end
    end
  end
end