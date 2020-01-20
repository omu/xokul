# frozen_string_literal: true

module Detsis
  class ParentEstablishmentsSerializer < Serializer
    attribute(:detsis_id)                                     { integer object[:detsis_no]                          }
    attribute(:name)                                          { string  object[:ad]                                 }
    attribute(:administrative_identity_code)                  { integer object[:ana_kurum_idare_kimlik_kodu]        }
    attribute(:primary_parent_administrative_identity_code)   { integer object[:parent_idare_kimlik_kodu]           }
    attribute(:secondary_parent_administrative_identity_code) { integer object[:parent_idare_kimlik_kodu2]          }
    attribute(:location_id)                                   { integer object[:fk_bulundugu_yer_id]                }
    attribute(:primary_establishment_type_id)                 { string  object[:fk_kurum_birim_tip_id1]             }
    attribute(:secondary_establishment_type_id)               { string  object[:fk_kurum_birim_tip_id2]             }
    attribute(:hierarchy)                                     { string  object[:kurum_hiyerarsik]                   }
    attribute(:active)                                        { boolean object[:aktifmi]                            }
    attribute(:activity)                                      { boolean object[:faal_olup_olmadigi]                 }
    attribute(:foreign_correspondence)                        { boolean object[:dis_yazisma_muhatabi_olup_olmadigi] }
    attribute(:address)                                       { string  object[:adres]                              }
    attribute(:level)                                         { integer object[:seviye]                             }
    attribute(:place)                                         { string  object[:yer_adi]                            }
  end
end
