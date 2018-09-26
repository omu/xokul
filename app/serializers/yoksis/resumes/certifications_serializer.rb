# frozen_string_literal: true

module Yoksis
  module Resumes
    class CertificationsSerializer < Serializer
      attribute(:id)                     { object[:s_id].safe_to_i                                                   }
      attribute(:name)                   { object[:adi].titleize_tr                                                  }
      attribute(:content)                { object[:icerik].titleize_tr                                               }
      attribute(:type_id)                { object[:tur_id].safe_to_i                                                 }
      attribute(:type_name)              { object[:tur_adi].titleize_tr                                              }
      attribute(:location)               { object[:yer].titleize_tr                                                  }
      attribute(:scope_id)               { object[:kapsam].safe_to_i                                                 }
      attribute(:scope_name)             { object[:kapsam_ad].titleize_tr                                            }
      attribute(:stint)                  { object[:sure].safe_to_i                                                   }
      attribute(:title_id)               { object[:unvan_id].safe_to_i                                               }
      attribute(:title_name)             { object[:unvan_ad].titleize_tr                                             }
      attribute(:institution_id)         { object[:kurum_id].safe_to_i                                               }
      attribute(:institution_name)       { object[:kurum_ad].titleize_tr                                             }
      attribute(:members_number)         { object[:kisi_sayisi].safe_to_i                                            }
      attribute(:country)                { object[:ulke_sehir] && object[:ulke_sehir].split('/').first.titleize_tr   }
      attribute(:city)                   { object[:ulke_sehir] && object[:ulke_sehir].split('/').last.titleize_tr    }
      attribute(:date_of_update)         { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
      attribute(:active_or_passive_id)   { object[:aktif_pasif].safe_to_i                                            }
      attribute(:active_or_passive_name) { object[:aktif_pasif_ad].titleize_tr                                       }
      attribute(:incentive_points)       { object[:tesv_puan].safe_to_f                                              }

      attribute :date_of_start do
        next unless object[:bastar]
        build_date(*object[:bastar].split('.').reverse.collect(&:safe_to_i))
      end

      attribute :date_of_end  do
        next unless object[:bittar]
        build_date(*object[:bittar].split('.').reverse.collect(&:safe_to_i))
      end
    end
  end
end
