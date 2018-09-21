# frozen_string_literal: true

module Yoksis
  module Military
    class InformationsSerializer < Serializer
      attribute(:id_number)  { object[:tcKimlikNo].safe_to_i }
      attribute(:first_name) { object[:adi]                  }
      attribute(:last_name)  { object[:soyadi]               }

      attribute :status do
        {
          code:        object[:askerlikDurumKod].safe_to_i,
          description: object[:askerlikDurumAciklama]
        }
      end

      attribute :operation do
        {
          code:        object[:islemKod],
          description: object[:islemAciklama]
        }
      end
    end
  end
end
