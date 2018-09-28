# frozen_string_literal: true

module Yoksis
  module Resumes
    class AuthorsSerializer < Serializer
      attribute(:registry_id)      { integer  object[:y_id]                                  }
      attribute(:id_number)        { integer  object[:tc_kimlik_no]                          }
      attribute(:first_name)       { string   object[:yazarad],            method: :titleize }
      attribute(:last_name)        { string   object[:yazarsoyad],         method: :titleize }
      attribute(:researcher_id)    { integer  object[:arastirmaci_id]                        }
      attribute(:title_id)         { integer  object[:kadro_unvan_id]                        }
      attribute(:title_name)       { string   object[:kadro_unvan_adi],    method: :titleize }
      attribute(:type_id)          { integer  object[:yazar_tur]                             }
      attribute(:type_name)        { string   object[:yazar_tur_ad],       method: :titleize }
      attribute(:form_id)          { integer  object[:yazar_form_id]                         }
      attribute(:university_id)    { integer  object[:univ_id]                               }
      attribute(:university_name)  { string   object[:universite],         method: :titleize }
      attribute(:users_ars_id)     { integer  object[:kullanicinin_ars_id]                   }
      attribute(:orc_id)           { integer  object[:yazar_orcid]                           }
      attribute(:date_of_update)   { datetime object[:guncelleme_tarihi]                     }
    end
  end
end
