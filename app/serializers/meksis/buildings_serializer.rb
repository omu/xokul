
module Meksis
  class BuildingsSerializer < Serializer
    attribute(:id)                 { integer object['id']                 }
    attribute(:name)               { string  object['name']               }
    attribute(:code)               { string  object['code']               }
    attribute(:unit_id)            { integer object['unit_id']            }
    attribute(:main_place_type_id) { integer object['main_place_type_id'] }
    attribute(:interior_area)      { float   object['interior_id']        }
    attribute(:active)             { boolean object['active']             }
  end
end
