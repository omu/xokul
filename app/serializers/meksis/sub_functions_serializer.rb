
module Meksis
  class SubFunctionsSerializer < Serializer
    attribute(:parent_id)   { integer object['AnaFonksiyonID']  }
    attribute(:parent_name) { string  object['AnaFonksiyonAdi'] }
    attribute(:id)          { integer object['AltFonksiyonID']  }
    attribute(:name)        { string  object['AltFonksiyonAdi'] }
  end
end
