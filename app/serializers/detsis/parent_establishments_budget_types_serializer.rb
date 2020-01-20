# frozen_string_literal: true

module Detsis
  class ParentEstablishmentsBudgetTypesSerializer < Serializer
    attribute(:detsis_id)                           { integer object[:detsis_no]                   }
    attribute(:id)                                  { integer object[:butce_turu_id]               }
    attribute(:name)                                { string  object[:butce_turu]                  }
    attribute(:establishment_name)                  { string  object[:ad]                          }
    attribute(:administrative_identity_code)        { string  object[:ana_kurum_idare_kimlik_kodu] }
    attribute(:parent_administrative_identity_code) { integer object[:parent_idare_kimlik_kodu]    }
    attribute(:legal_entity_id)                     { integer object[:fk_tuzel_kisilik_id]         }
    attribute(:legal_entity_name)                   { string  object[:tuzel_kisilik]               }
  end
end
