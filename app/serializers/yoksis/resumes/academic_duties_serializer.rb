# frozen_string_literal: true

module Yoksis
  module Resumes
    class AcademicDutiesSerializer < Serializer
      attribute(:academic_status_id)    { integer        object[:akademik_durum]                                   }
      attribute(:academic_status_name)  { string         object[:akademik_durum_adi]                               }
      attribute(:academic_unit_name)    { string         object[:akademik_birim_adi], ->(p) { p.gsub(%r{/*$}, '') } }
      attribute(:activity_id)           { integer        object[:aktif_pasif]                                      }
      attribute(:activity_name)         { string         object[:aktif_pasif_ad]                                   }
      attribute(:country_id)            { integer        object[:ulke_id]                                          }
      attribute(:country_name)          { string         object[:ulke_ad]                                          }
      attribute(:department)            { string         object[:bolumbilgisi]                                     }
      attribute(:discipline)            { string         object[:alanbilgisi]                                      }
      attribute(:end_date)              { integer        object[:bittar1]                                          }
      attribute(:faculty)               { string         object[:fakultebilgisi]                                   }
      attribute(:id)                    { integer        object[:gorev_id]                                         }
      attribute(:last_update)           { parse_datetime object[:guncelleme_tarihi]                                }
      attribute(:location_id)           { integer        object[:yer_id]                                           }
      attribute(:location_name)         { string         object[:yer_ad]                                           }
      attribute(:profession_id)         { integer        object[:uzmanlik_alani]                                   }
      attribute(:profession_name)       { string         object[:uzmanlik_alani_ad]                                }
      attribute(:scientific_field_name) { string         object[:bilimalan_adi]                                    }
      attribute(:start_date)            { integer        object[:bastar1]                                          }
      attribute(:title_id)              { integer        object[:kadro_unvan_id]                                   }
      attribute(:title_name)            { string         object[:kadro_unvan_adi]                                  }
      attribute(:unit_id)               { integer        object[:birim_id]                                         }
      attribute(:university_id)         { integer        object[:univ_id]                                          }
      attribute(:university_name)       { string         object[:univ_birim_adi]                                   }
    end
  end
end
