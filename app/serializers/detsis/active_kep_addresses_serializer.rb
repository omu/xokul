# frozen_string_literal: true

module Detsis
  class ActiveKepAddressesSerializer < Serializer
    attribute(:detsis_id) { integer(object[:kurum_detsis_no])    }
    attribute(:address)   { string(object[:kep_adresi]).downcase }
  end
end
