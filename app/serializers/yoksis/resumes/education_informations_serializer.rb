# frozen_string_literal: true

module Yoksis
  module Resumes
    class EducationInformationsSerializer < Serializer
      attribute(:registry_id)                   { integer        object[:id]                        }
      attribute(:place_id)                      { integer        object[:yer_id]                    }
      attribute(:place_name)                    { string         object[:yer_ad]                    }
      attribute(:year_of_start)                 { integer        object[:bastar1]                   }
      attribute(:year_of_end)                   { integer        object[:bittar1]                   }
      attribute(:country_id)                    { integer        object[:ulke_id]                   }
      attribute(:country_name)                  { string         object[:ulke_ad]                   }
      attribute(:other_field)                   { string         object[:diger_alan]                }
      attribute(:yok_unit_id)                   { integer        object[:birim_yok]                 }
      attribute(:program_id)                    { integer        object[:program_id]                }
      attribute(:program_name)                  { string         object[:program_adi]               }
      attribute(:other_university)              { string         object[:diger_universite]          }
      attribute(:thesis_name)                   { string         object[:tez_adi]                   }
      attribute(:thesis_step_id)                { integer        object[:tez_asamasi]               }
      attribute(:thesis_step_name)              { string         object[:tez_asamasi_ad]            }
      attribute(:start_date_of_thesis)          { integer        object[:tez_bas_tar]               }
      attribute(:end_date_of_thesis)            { integer        object[:tez_bit_tar]               }
      attribute(:university_id)                 { integer        object[:univ_id]                   }
      attribute(:university_name)               { string         object[:unv_birim_adi]             }
      attribute(:academic_unit_id)              { integer        object[:akademik_birim_id]         }
      attribute(:academic_unit_name)            { string         object[:akademik_birim_adi]        }
      attribute(:faculty)                       { string         object[:fakultebilgisi]            }
      attribute(:department)                    { string         object[:bolumbilgisi]              }
      attribute(:field)                         { string         object[:alanbilgisi]               }
      attribute(:diploma_no)                    { integer        object[:diploma_no]                }
      attribute(:number_of_diploma_equivalency) { integer        object[:diplomadenklik_tarih_sayi] }
      attribute(:advisors_id_number)            { integer        object[:danisman_tc]               }
      attribute(:advisor)                       { string         object[:danisman_ad_soyad]         }
      attribute(:c_unit_id)                     { integer        object[:c_birim_id]                }
      attribute(:c_unit_name)                   { integer        object[:c_birim_ad]                }
      attribute(:active_or_passive_id)          { integer        object[:aktif_pasif]               }
      attribute(:active_or_passive_name)        { string         object[:aktif_pasif_ad]            }
      attribute(:date_of_update)                { parse_datetime object[:guncelleme_tarihi]         }
    end
  end
end
