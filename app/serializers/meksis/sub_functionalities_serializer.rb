
module Meksis
  class SubFunctionalitiesSerializer < Serializer
    attribute(:id)   { integer object['AltFonksiyonID']  }
    attribute(:name) { string  object['AltFonksiyonAdi'] }
  end
end
