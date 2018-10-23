# frozen_string_literal: true

module Yoksis
  module Resumes
    class FieldsSerializer < Serializer
      attribute(:activity_id)           { integer        object[:aktif_pasif]       }
      attribute(:activity_name)         { string         object[:aktif_pasif_ad]    }
      attribute(:id)                    { integer        object[:temel_alan_id]     }
      attribute(:last_update)           { parse_datetime object[:guncelleme_tarihi] }
      attribute(:name)                  { string         object[:temel_alan_ad]     }
      attribute(:scientific_field_id)   { integer        object[:bilim_alan_id]     }
      attribute(:scientific_field_name) { string         object[:bilim_alan_ad]     }
      attribute(:yoksis_id)             { integer        object[:t_uak_id]          }

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
