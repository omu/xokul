
module Meksis
  class DepartmentSyllabusesSerializer < Serializer
    attribute(:id)              { integer    object['DersprogramID']                                        }
    attribute(:lecture_name)    { string     object['DersAdi']                                              }
    attribute(:lecture_code)    { string     object['DersKodu']                                             }
    attribute(:start_date)      { parse_date Time.at((object['DersBaslamaTarihi'])[/([0-9]+)/].to_i / 1000) }
    attribute(:end_date)        { parse_date Time.at((object['DersBitisTarihi'])[/([0-9]+)/].to_i / 1000)   }
    attribute(:start_time)      { string     object['BaslamaSaatiDetay']                                    }
    attribute(:end_time)        { string     object['BitisSaatiDetay']                                      }
    attribute(:classroom_id)    { integer    object['DerslikID']                                            }
    attribute(:classroom_code)  { string     object['DerslikKodu']                                          }
    attribute(:classroom_name)  { string     object['DerslikAdi']                                           }
    attribute(:unit_id)         { integer    object['BirimID']                                              }
    attribute(:unit_name)       { string     object['BirimAdi']                                             }
    attribute(:department_id)   { integer    object['BolumID']                                              }
    attribute(:department_name) { string     object['BolumAdi']                                             }
    attribute(:grade)           { integer    object['Sinif']                                                }
    attribute(:branch)          { integer    object['Sube']                                                 }
    attribute(:capacity)        { integer    object['OgrenciSayisi']                                        }
    attribute(:building_name)   { string     object['BinaAdi']                                              }
  end
end
