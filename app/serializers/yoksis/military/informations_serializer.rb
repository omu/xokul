# frozen_string_literal: true

module Yoksis
  module Military
    class InformationsSerializer < Serializer
      attribute(:id_number)  { integer object[:tcKimlikNo]       }
      attribute(:first_name) { string  object[:adi]              }
      attribute(:last_name)  { string  object[:soyadi]           }
      attribute(:status)     { integer object[:askerlikDurumKod] }
    end
  end
end
