
module Meksis
  class CharacteristicsSerializer < Serializer
    attribute(:id)                      { integer object['KarakteristikID'] }
    attribute(:name)                    { string  object['KarkteristikAdi'] }
    attribute(:main_functionality_id)   { integer object['AnaFonksiyonID']  }
    attribute(:main_functionality_name) { string  object['AnaFonksiyonAdi'] }
    attribute(:sub_functionality_id)    { integer object['AltFonksiyonID']  }
    attribute(:sub_functionality_name)  { string  object['AltFonksiyonAdi'] }
  end
end
