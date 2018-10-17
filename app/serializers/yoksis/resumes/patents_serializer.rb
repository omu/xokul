# frozen_string_literal: true

module Yoksis
  module Resumes
    class PatentsSerializer < Serializer
      attribute(:activity_id)      { integer        object[:aktif_pasif]                              }
      attribute(:activity_name)    { string         object[:aktif_pasif_ad]                           }
      attribute(:applicants)       { split_string   object[:basvuru_sahipleri]                        }
      attribute(:category_id)      { integer        object[:kategori_id]                              }
      attribute(:category_name)    { string         object[:kategori]                                 }
      attribute(:class)            { string         object[:patent_sinif], ->(p) { p.upcase :turkic } }
      attribute(:date)             { integer        object[:patent_tarihi]                            }
      attribute(:file_type_id)     { integer        object[:dosya_tipi_id]                            }
      attribute(:file_type_name)   { string         object[:dosya_tipi]                               }
      attribute(:id)               { integer        object[:patent_id]                                }
      attribute(:incentive_point)  { float          object[:tesv_puan]                                }
      attribute(:inventors)        { split_string   object[:bulus_sahipleri]                          }
      attribute(:last_update)      { parse_datetime object[:guncelleme_tarihi]                        }
      attribute(:name)             { string         object[:patent_adi]                               }
      attribute(:no)               { integer        object[:patent_no]                                }
      attribute(:number_of_person) { integer        object[:kisi_sayisi]                              }
      attribute(:scope_id)         { integer        object[:kapsam_id]                                }
      attribute(:scope_name)       { string         object[:kapsam]                                   }
      attribute(:title_id)         { integer        object[:unvan_id]                                 }
      attribute(:title_name)       { string         object[:unvan_ad]                                 }
      attribute(:unit_id)          { integer        object[:kurum_id]                                 }
      attribute(:unit_name)        { string         object[:kurum_ad]                                 }
    end
  end
end
