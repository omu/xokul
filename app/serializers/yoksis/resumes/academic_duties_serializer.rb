# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicDutiesSerializer < Serializer
      attribute(:duty_id)                      { integer  object[:gorev_id]                              }
      attribute(:year_of_start)                { integer  object[:bastar1]                               }
      attribute(:year_of_end)                  { integer  object[:bittar1]                               }
      attribute(:place_id)                     { integer  object[:yer_id]                                }
      attribute(:place_name)                   { string   object[:yer_ad],             method: :titleize }
      attribute(:country_id)                   { integer  object[:ulke_id]                               }
      attribute(:country_name)                 { string   object[:ulke_ad],            method: :titleize }
      attribute(:scientific_field_name)        { string   object[:bilimalan_adi],      method: :titleize }
      attribute(:university_id)                { integer  object[:univ_id]                               }
      attribute(:university_name)              { string   object[:univ_birim_adi],     method: :titleize }
      attribute(:faculty)                      { string   object[:fakultebilgisi],     method: :titleize }
      attribute(:department)                   { string   object[:bolumbilgisi],       method: :titleize }
      attribute(:unit_id)                      { integer  object[:birim_id]                              }
      attribute(:field)                        { string   object[:alanbilgisi],        method: :titleize }
      attribute(:field_of_specialization_id)   { integer  object[:uzmanlik_alani]                        }
      attribute(:field_of_specialization_name) { string   object[:uzmanlik_alani_ad],  method: :titleize }
      attribute(:title_id)                     { integer  object[:kadro_unvan_id]                        }
      attribute(:title_name)                   { string   object[:kadro_unvan_adi],    method: :titleize }
      attribute(:academic_status_id)           { integer  object[:akademik_durum]                        }
      attribute(:academic_status_name)         { string   object[:akademik_durum_adi], method: :titleize }
      attribute(:academic_unit_name)           { string   object[:akademik_birim_adi], method: :titleize }
      attribute(:active_or_passive_id)         { integer  object[:aktif_pasif]                           }
      attribute(:active_or_passive_name)       { string   object[:aktif_pasif_ad],     method: :titleize }
      attribute(:date_of_update)               { datetime object[:guncelleme_tarihi]                     }
    end
  end
end
