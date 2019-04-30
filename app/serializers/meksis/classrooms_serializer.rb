
module Meksis
  class ClassroomsSerializer < Serializer
    attribute(:id)                    { integer object['DerslikID']       }
    attribute(:name)                  { string  object['DerslikAdi']      }
    attribute(:code)                  { string  object['DerslikKodu']     }
    attribute(:room_number)           { integer object['Odano']           }
    attribute(:campus_id)             { integer object['KampusID']        }
    attribute(:capacity)              { integer object['Kapasite']        }
    attribute(:exam_capacity)         { integer object['SinavKapasite']   }
    attribute(:building_id)           { integer object['BinaID']          }
    attribute(:characteristic_id)     { integer object['KarakteristikID'] }
    attribute(:characteristic_name)   { string  object['Karakteristigi']  }
    attribute(:height)                { float   object['Boy']             }
    attribute(:width)                 { float   object['En']              }
    attribute(:volume)                { float   object['Hacim']           }
    attribute(:elevation)             { float   object['Yukseklik']       }
    attribute(:usage_area)            { float   object['KullanimAlani']   }
    attribute(:main_functionality_id) { integer object['AnaFonksiyonID']  }
    attribute(:sub_functionality_id)  { integer object['AltFonksiyonID']  }
  end
end