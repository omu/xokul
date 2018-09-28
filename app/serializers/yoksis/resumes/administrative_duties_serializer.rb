# frozen_string_literal: true

module Yoksis
  module Resumes
    class AdministrativeDutiesSerializer < Serializer
      attribute(:registry_id)            { integer  object[:idgor_id]                            }
      attribute(:id)                     { integer  object[:gorev_id]                            }
      attribute(:name)                   { string   object[:gorev_adi],        method: :titleize }
      attribute(:place_id)               { integer  object[:yer_id]                              }
      attribute(:place_name)             { string   object[:yer_ad],           method: :titleize }
      attribute(:country_id)             { integer  object[:ulke_id]                             }
      attribute(:country_name)           { string   object[:ulke_adi],         method: :titleize }
      attribute(:year_of_start)          { integer  object[:bas_tar]                             }
      attribute(:year_of_end)            { integer  object[:bit_tar]                             }
      attribute(:university_id)          { integer  object[:unv_id]                              }
      attribute(:university_name)        { string   object[:unv_birim_adi],    method: :titleize }
      attribute(:major)                  { string   object[:abd],              method: :titleize }
      attribute(:faculty)                { string   object[:fakultemyoenst],   method: :titleize }
      attribute(:department)             { string   object[:bolumbilgisi],     method: :titleize }
      attribute(:active_or_passive_id)   { integer  object[:aktif_pasif]                         }
      attribute(:active_or_passive_name) { string   object[:aktif_pasif_ad],   method: :titleize }
      attribute(:date_of_update)         { datetime object[:guncelleme_tarihi]                   }
    end
  end
end
