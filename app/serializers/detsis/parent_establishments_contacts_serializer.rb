# frozen_string_literal: true

module Detsis
  class ParentEstablishmentsContactsSerializer < Serializer
    attribute(:detsis_id) { integer object[:detsis_no]    }
    attribute(:type)      { integer object[:iletisim_tip] }
    attribute(:name)      { string  object[:iletisim_adi] }
    attribute(:contact)   { string  object[:iletisim]     }
  end
end
