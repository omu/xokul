# frozen_string_literal: true

module Meksis
  class CharacteristicsSerializer < Serializer
    attribute(:id)                 { integer object['KarakteristikID'] }
    attribute(:name)               { string  object['KarkteristikAdi'] }
    attribute(:main_function_id)   { integer object['AnaFonksiyonID']  }
    attribute(:main_function_name) { string  object['AnaFonksiyonAdi'] }
    attribute(:sub_function_id)    { integer object['AltFonksiyonID']  }
    attribute(:sub_function_name)  { string  object['AltFonksiyonAdi'] }
  end
end
