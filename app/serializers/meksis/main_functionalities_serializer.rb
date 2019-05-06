
module Meksis
  class MainFunctionalitiesSerializer < Serializer
    attribute(:id)   { integer object['AnaFonksiyonID']  }
    attribute(:name) { string  object['AnaFonksiyonAdi'] }
  end
end
