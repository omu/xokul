# frozen_string_literal: true

module Yoksis
  module Military
    class InformationsSerializer < Serializer
      attribute(:id_number)  { integer object[:tcKimlikNo]                }
      attribute(:first_name) { string  object[:adi],    method: :titleize }
      attribute(:last_name)  { string  object[:soyadi], method: :titleize }

      attribute :status do
        {
          code:        integer(object[:askerlikDurumKod]),
          description: string(object[:askerlikDurumAciklama], method: :capitalize)
        }
      end
    end
  end
end
