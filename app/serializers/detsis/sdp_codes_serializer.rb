# frozen_string_literal: true

module Detsis
  class SdpCodesSerializer < Serializer
    attribute(:id)                  { integer object[:id]             }
    attribute(:code)                { string  object[:kod]            }
    attribute(:main_code)           { integer object[:ana_kod]        }
    attribute(:sub_code_1)          { integer object[:alt_kod1]       }
    attribute(:sub_code_2)          { integer object[:alt_kod2]       }
    attribute(:sub_code_3)          { integer object[:alt_kod3]       }
    attribute(:level)               { string  object[:seviye]         }
    attribute(:preservation_period) { string  object[:saklama_suresi] }
    attribute(:preservation_time)   { string  object[:saklama_zaman]  }
    attribute(:preservation_code)   { string  object[:saklama_kodu]   }
    attribute(:reason)              { string  object[:konu_adi]       }
    attribute(:description)         { string  object[:aciklama]       }
    attribute(:active)              { boolean object[:aktifmi]        }
    attribute(:annotation)          { string  object[:dipnot]         }
  end
end
  