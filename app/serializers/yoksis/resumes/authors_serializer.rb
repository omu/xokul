# frozen_string_literal: true

module Yoksis
  module Resumes
    class AuthorsSerializer < Serializer
      attribute(:ars_id)          { integer        object[:kullanicinin_ars_id] }
      attribute(:first_name)      { string         object[:yazarad]             }
      attribute(:form_id)         { integer        object[:yazar_form_id]       }
      attribute(:id_number)       { integer        object[:tc_kimlik_no]        }
      attribute(:last_name)       { string         object[:yazarsoyad]          }
      attribute(:last_update)     { parse_datetime object[:guncelleme_tarihi]   }
      attribute(:orc_id)          { integer        object[:yazar_orcid]         }
      attribute(:researcher_id)   { integer        object[:arastirmaci_id]      }
      attribute(:title_id)        { integer        object[:kadro_unvan_id]      }
      attribute(:title_name)      { string         object[:kadro_unvan_adi]     }
      attribute(:type_id)         { integer        object[:yazar_tur]           }
      attribute(:type_name)       { string         object[:yazar_tur_ad]        }
      attribute(:university_id)   { integer        object[:univ_id]             }
      attribute(:university_name) { string         object[:universite]          }
      attribute(:yoksis_id)       { integer        object[:y_id]                }
    end
  end
end
