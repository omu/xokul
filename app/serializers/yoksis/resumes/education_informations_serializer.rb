# frozen_string_literal: true

module Yoksis
  module Resumes
    class EducationInformationsSerializer < Serializer
      attribute(:academic_unit_id)     { integer        object[:akademik_birim_id]         }
      attribute(:academic_unit_name)   { string         object[:akademik_birim_adi]        }
      attribute(:activity_id)          { integer        object[:aktif_pasif]               }
      attribute(:activity_name)        { string         object[:aktif_pasif_ad]            }
      attribute(:advisor)              { string         object[:danisman_ad_soyad]         }
      attribute(:advisors_id_number)   { integer        object[:danisman_tc]               }
      attribute(:c_unit_id)            { integer        object[:c_birim_id]                }
      attribute(:c_unit_name)          { integer        object[:c_birim_ad]                }
      attribute(:country_id)           { integer        object[:ulke_id]                   }
      attribute(:country_name)         { string         object[:ulke_ad]                   }
      attribute(:department)           { string         object[:bolumbilgisi]              }
      attribute(:diploma_equivalency)  { integer        object[:diplomadenklik_tarih_sayi] }
      attribute(:diploma_no)           { integer        object[:diploma_no]                }
      attribute(:discipline)           { string         object[:alanbilgisi]               }
      attribute(:end_date)             { integer        object[:bittar1]                   }
      attribute(:end_date_of_thesis)   { integer        object[:tez_bit_tar]               }
      attribute(:faculty)              { string         object[:fakultebilgisi]            }
      attribute(:last_update)          { parse_datetime object[:guncelleme_tarihi]         }
      attribute(:location_id)          { integer        object[:yer_id]                    }
      attribute(:location_name)        { string         object[:yer_ad]                    }
      attribute(:other_discipline)     { string         object[:diger_alan]                }
      attribute(:other_university)     { string         object[:diger_universite]          }
      attribute(:program_id)           { integer        object[:program_id]                }
      attribute(:program_name)         { string         object[:program_adi]               }
      attribute(:start_date)           { integer        object[:bastar1]                   }
      attribute(:start_date_of_thesis) { integer        object[:tez_bas_tar]               }
      attribute(:thesis_name)          { string         object[:tez_adi]                   }
      attribute(:thesis_step_id)       { integer        object[:tez_asamasi]               }
      attribute(:thesis_step_name)     { string         object[:tez_asamasi_ad]            }
      attribute(:unit_id)              { integer        object[:birim_yok]                 }
      attribute(:university_id)        { integer        object[:univ_id]                   }
      attribute(:university_name)      { string         object[:unv_birim_adi]             }
      attribute(:yoksis_id)            { integer        object[:id]                        }
    end
  end
end
