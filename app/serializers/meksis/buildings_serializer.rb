
module Meksis
  class BuildingsSerializer < Serializer
    attribute(:id)                 { integer object['BinaID']                         }
    attribute(:name)               { string  object['BinaAdi']                        }
    attribute(:short_name)         { string  object['BinaKisaAdi']                    }
    attribute(:unit_id)            { integer object['AkademikIdariBirimID']           }
    attribute(:main_place_type_id) { integer object['AnaFonksiyonID']                 }
    attribute(:interior_area)      { float   object['KapaliAlan']                     }
    attribute(:active)             { boolean object['Aktifmi'].eql?(1) ? true : false }
  end
end
