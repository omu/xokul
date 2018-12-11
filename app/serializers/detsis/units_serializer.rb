# frozen_string_literal: true

module Detsis
  class UnitsSerializer < Serializer
    attribute(:detsis_id)        { integer object[:detsis_no]                                            }
    attribute(:name)             { string  object[:kurum_hiyerarsik].split('>').map(&:strip).join(' > ') }
    attribute(:parent_detsis_id) { integer object[:parent_idare_kimlik_kodu]                             }
    attribute(:active)           { boolean object[:aktifmi]                                              }
    attribute(:activity)         { boolean object[:faal_olup_olmadigi]                                   }
  end
end
