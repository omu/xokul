# frozen_string_literal: true

module Yoksis
  module Meb
    class DetailedGraduationDataSerializer < ActiveModel::Serializer
      attribute(:tck_no)         { object[:tckimlikno]  }
      attribute(:firstname)      { object[:adi]         }
      attribute(:lastname)       { object[:soyadi]      }
      attribute(:school_id)      { object[:okulkodu]    }
      attribute(:school_name)    { object[:okuladi]     }
      attribute(:school_type_id) { object[:okulturkodu] }
    end
  end
end
