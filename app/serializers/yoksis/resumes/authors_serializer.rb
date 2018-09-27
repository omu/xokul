# frozen_string_literal: true

module Yoksis
  module Resumes
    class AuthorsSerializer < Serializer
      attribute(:registry_id)      { object[:y_id].safe_to_i                                                   }
      attribute(:id_number)        { object[:tc_kimlik_no].safe_to_i                                           }
      attribute(:first_name)       { object[:yazarad].titleize_tr                                              }
      attribute(:last_name)        { object[:yazarsoyad].titleize_tr                                           }
      attribute(:researcher_id)    { object[:arastirmaci_id].safe_to_i                                         }
      attribute(:title_id)         { object[:kadro_unvan_id].safe_to_i                                         }
      attribute(:title_name)       { object[:kadro_unvan_adi].titleize_tr                                      }
      attribute(:type_id)          { object[:yazar_tur].safe_to_i                                              }
      attribute(:type_name)        { object[:yazar_tur_ad].titleize_tr                                         }
      attribute(:form_id)          { object[:yazar_form_id].safe_to_i                                          }
      attribute(:university_id)    { object[:univ_id].safe_to_i                                                }
      attribute(:university_name)  { object[:universite].titleize_tr                                           }
      attribute(:users_ars_id)     { object[:kullanicinin_ars_id].safe_to_i                                    }
      attribute(:orc_id)           { object[:yazar_orcid].safe_to_i                                            }
      attribute(:date_of_update)   { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
