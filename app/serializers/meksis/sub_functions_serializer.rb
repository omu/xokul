
module Meksis
  class SubFunctionsSerializer < Serializer
    attribute(:id)   { string  object['AnaFonksiyonID']  }
    attribute(:name) { string  object['AnaFonksiyonAdi'] }
    attribute(:id)   { integer object['AltFonksiyonID']  }
    attribute(:name) { string  object['AltFonksiyonAdi'] }
  end
end
