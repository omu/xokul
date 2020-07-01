# frozen_string_literal: true

module Yoksis
  module Prospectives
    class StudentsSerializer < Serializer
      attribute(:id_number)                       { integer        object[:tcKimlikNo]                         }
      attribute(:first_name)                      { string         object[:adi]                                }
      attribute(:last_name)                       { string         object[:soyadi]                             }
      attribute(:fathers_name)                    { string         object[:babaAdi]                            }
      attribute(:mothers_name)                    { string         object[:anneAdi]                            }
      attribute(:gender)                          { string         object[:cinsiyet]                           }
      attribute(:date_of_birth)                   { parse_date     object[:dogumTarihi]                        }
      attribute(:turkish_citizen)                 { boolean        (object[:uyrukTc] == 1 ? true : false)      }
      attribute(:kktc_citizen)                    { boolean        (object[:uyrukKktc] == 1 ? true : false)    }
      attribute(:foreign_national)                { boolean        (object[:uyrukYabanci] == 1 ? true : false) }
      attribute(:place_of_birth)                  { string         object[:dogumYer]                           }
      attribute(:registered_city)                 { string         object[:nufusIl]                            }
      attribute(:registered_district)             { string         object[:nufusIlce]                          }
      attribute(:high_school_code)                { string         object[:okulKodu]                           }
      attribute(:high_school_type)                { string         object[:okulTuru]                           }
      attribute(:high_school_branch)              { string         object[:okulKolu]                           }
      attribute(:state_of_education)              { integer        object[:ogrenimDurumu]                      }
      attribute(:high_school_graduation_year)     { integer        object[:ortaOgrenimMezuniyet]               }
      attribute(:placement_type)                  { string         object[:yerlesmeTuru]                       }
      attribute(:high_school_gpa)                 { float          object[:basariPuani]                        }
      attribute(:full_address)                    { string         object[:adres]                              }
      attribute(:city_code)                       { integer        object[:adresIl]                            }
      attribute(:district)                        { string         object[:semtIlce]                           }
      attribute(:home_phone)                      { string         object[:evTel]                              }
      attribute(:mobile_phone)                    { string         object[:cepTel]                             }
      attribute(:email)                           { string         object[:eposta]                             }
      attribute(:top_scoring_student)             { boolean        (object[:okulBirinci] == 1 ? true : false)  }
      attribute(:placement_score)                 { float          object[:yerKullanilanPuani]                 }
      attribute(:placement_ranking)               { integer        object[:yerKullanilanBasariSirasi]          }
      attribute(:university_code)                 { string         object[:universiteKodu]                     }
      attribute(:university_name)                 { string         object[:universiteAdi]                      }
      attribute(:faculty_name)                    { string         object[:fakulteAdi]                         }
      attribute(:program_code)                    { string         object[:programKodu]                        }
      attribute(:program_name)                    { string         object[:programAdi]                         }
      attribute(:order_of_choice)                 { integer        object[:tercihSirasi]                       }
      attribute(:placement_point_type)            { string         object[:yerlestigiPuanTuru]                 }
      attribute(:quota)                           { string         object[:kontenjan]                          }
      attribute(:meb_status_code)                 { integer        object[:mebDurum]                           }
      attribute(:meb_status_name)                 { string         object[:mebDurumAciklama]                   }
      attribute(:meb_last_query_date)             { parse_datetime object[:mebSorgulamaTarihi]                 }
      attribute(:asal_status_code)                { string         object[:asalDurum]                          }
      attribute(:asal_status_name)                { string         object[:asalDurumAciklama]                  }
      attribute(:asal_last_query_date)            { parse_datetime object[:asalSorgulamaTarihi]                }
      attribute(:obs_status_code)                 { string         object[:obsKontrol]                         }
      attribute(:obs_last_query_date)             { parse_datetime object[:obsKontrolSorgulamaTarihi]          }
      attribute(:active_program)                  { string         object[:okuduguProgram]                     }
      attribute(:online_registration_term_id)     { integer        object[:ekayitDonemId]                      }
      attribute(:online_registration_term_name)   { string         object[:ekayitDonemAdi]                     }
      attribute(:online_registration_term_type)   { string         object[:ekayitDonemTuru]                    }
      attribute(:prep_class_code)                 { integer        object[:ibHazirlikSinifi]                   }
      attribute(:online_registration_permit_code) { integer        object[:ekayitIzin]                         }
      attribute(:online_registration_permit_date) { parse_datetime object[:ekayitTarihi]                       }
    end
  end
end
