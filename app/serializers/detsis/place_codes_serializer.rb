# frozen_string_literal: true

module Detsis
  class PlaceCodesSerializer < Serializer
    attribute(:id)               { integer object[:id]                }
    attribute(:name)             { string  object[:yer_adi]           }
    attribute(:code)             { integer object[:yer_kodu]          }
    attribute(:type)             { string  object[:yer_tipi]          }
    attribute(:city_name)        { string  object[:il_adi]            }
    attribute(:city_code)        { integer object[:il_kodu]           }
    attribute(:fk_place_type_id) { integer object[:fk_yer_tipi_id]    }
    attribute(:area_code)        { string  object[:telefon_alan_kodu] }
    attribute(:active)           { boolean object[:aktifmi]           }
  end
end
  