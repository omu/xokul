
module Meksis
  class AdministrativeUnitsSerializer < Serializer
    attribute(:unit_id)            { integer object['AkademikIdariBirimID']           }
    attribute(:unit_name)          { string  object['AkademikIdariBirimAdi']          }
    attribute(:university_id)      { integer object['UniversiteID']                   }
    attribute(:number_of_staff)    { integer object['PersonelSayisi']                 }
    attribute(:number_of_students) { integer object['OgrenciSayisi']                  }
    attribute(:active)             { boolean object['Aktifmi'].eql?(1) ? true : false }
  end
end
