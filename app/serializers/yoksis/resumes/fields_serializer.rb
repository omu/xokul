# frozen_string_literal: true

module Yoksis
  module Resumes
    class FieldsSerializer < Serializer
      attribute(:registry_id)            { integer        object[:t_uak_id]          }
      attribute(:field_id)               { integer        object[:temel_alan_id]     }
      attribute(:field_name)             { string         object[:temel_alan_ad]     }
      attribute(:scientific_field_id)    { integer        object[:bilim_alan_id]     }
      attribute(:scientific_field_name)  { string         object[:bilim_alan_ad]     }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }

      attribute :keywords do
        [
          { id: integer(object[:anahtarkelime1_id]), name: string(object[:anahtarkelime1_ad]) },
          { id: integer(object[:anahtarkelime2_id]), name: string(object[:anahtarkelime2_ad]) },
          { id: integer(object[:anahtarkelime3_id]), name: string(object[:anahtarkelime3_ad]) }
        ]
      end
    end
  end
end
