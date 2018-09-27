# frozen_string_literal: true

module Yoksis
  module Resumes
    class FieldsSerializer < Serializer
      attribute(:registration_id)        { object[:t_uak_id].safe_to_i                                               }
      attribute(:id)                     { object[:temel_alan_id].safe_to_i                                          }
      attribute(:name)                   { object[:temel_alan_ad].titleize_tr                                        }
      attribute(:scientific_field_id)    { object[:bilim_alan_id].safe_to_i                                          }
      attribute(:scientific_field_name)  { object[:bilim_alan_ad].titleize_tr                                        }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }

      attribute :keywords do
        [
          { id: object[:anahtarkelime1_id].safe_to_i, name: object[:anahtarkelime1_ad].titleize_tr },
          { id: object[:anahtarkelime2_id].safe_to_i, name: object[:anahtarkelime2_ad].titleize_tr },
          { id: object[:anahtarkelime3_id].safe_to_i, name: object[:anahtarkelime3_ad].titleize_tr }
        ]
      end
    end
  end
end
