# frozen_string_literal: true

module Meksis
  class SubPlaceTypesSerializer < Serializer
    attribute(:parent_id)   { integer object['AnaFonksiyonID']  }
    attribute(:parent_name) { string  object['AnaFonksiyonAdi'] }
    attribute(:id)          { integer object['AltFonksiyonID']  }
    attribute(:name)        { string  object['AltFonksiyonAdi'] }
  end
end
