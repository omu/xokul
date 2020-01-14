# frozen_string_literal: true

module Detsis
  class TypeOneCodesSerializer < Serializer
    attribute(:id)                      { integer        object[:id]                          }
    attribute(:establishment_id)        { string         object[:kurum_birim_tipi1]           }
    attribute(:parent_establishment_id) { integer        object[:kurum_birim_tipi1_parent_id] }
    attribute(:registration_date)       { parse_datetime object[:kayit_tarihi]                }
    attribute(:active)                  { boolean        object[:aktifmi]                     }
  end
end
  