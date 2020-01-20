# frozen_string_literal: true

module Detsis
  class OfficiersSerializer < Serializer
    attribute(:first_name)      { string object[:adi]     } 
    attribute(:last_name)       { string object[:soyadi]  } 
    attribute(:phone)           { string object[:telefon] } 
    attribute(:email)           { string object[:email]   } 
    attribute(:responsible_for) { string object[:yetkisi] } 
  end
end
  