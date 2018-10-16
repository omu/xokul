# frozen_string_literal: true

module Yoksis
  module Resumes
    class PatentsSerializer < Serializer
      attribute(:patent_id)              { integer        object[:patent_id]                                }
      attribute(:name)                   { string         object[:patent_adi]                               }
      attribute(:no)                     { integer        object[:patent_no]                                }
      attribute(:class)                  { string         object[:patent_sinif], ->(p) { p.upcase :turkic } }
      attribute(:year)                   { integer        object[:patent_tarihi]                            }
      attribute(:applicants)             { split_string   object[:basvuru_sahipleri]                        }
      attribute(:inventors)              { split_string   object[:bulus_sahipleri]                          }
      attribute(:number_of_person)       { integer        object[:kisi_sayisi]                              }
      attribute(:category_id)            { integer        object[:kategori_id]                              }
      attribute(:category_name)          { string         object[:kategori]                                 }
      attribute(:file_type_id)           { integer        object[:dosya_tipi_id]                            }
      attribute(:file_type_name)         { string         object[:dosya_tipi]                               }
      attribute(:scope_id)               { integer        object[:kapsam_id]                                }
      attribute(:scope_name)             { string         object[:kapsam]                                   }
      attribute(:title_id)               { integer        object[:unvan_id]                                 }
      attribute(:title_name)             { string         object[:unvan_ad]                                 }
      attribute(:institution_id)         { integer        object[:kurum_id]                                 }
      attribute(:institution_name)       { string         object[:kurum_ad]                                 }
      attribute(:incentive_points)       { float          object[:tesv_puan]                                }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]                              }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]                           }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi]                        }
    end
  end
end
