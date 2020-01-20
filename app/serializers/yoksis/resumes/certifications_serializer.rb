# frozen_string_literal: true

module Yoksis
  module Resumes
    class CertificationsSerializer < Serializer
      attribute(:activity_id)       { integer        object[:aktif_pasif]       }
      attribute(:activity_name)     { string         object[:aktif_pasif_ad]    }
      attribute(:city_and_country)  { string         object[:ulke_sehir]        }
      attribute(:content)           { string         object[:icerik]            }
      attribute(:duration)          { integer        object[:sure]              }
      attribute(:incentive_point)   { float          object[:tesv_puan]         }
      attribute(:last_update)       { parse_datetime object[:guncelleme_tarihi] }
      attribute(:location)          { string         object[:yer]               }
      attribute(:name)              { string         object[:adi]               }
      attribute(:number_of_authors) { integer        object[:kisi_sayisi]       }
      attribute(:scope_id)          { integer        object[:kapsam]            }
      attribute(:scope_name)        { string         object[:kapsam_ad]         }
      attribute(:title_id)          { integer        object[:unvan_id]          }
      attribute(:title_name)        { string         object[:unvan_ad]          }
      attribute(:type_id)           { integer        object[:tur_id]            }
      attribute(:type_name)         { string         object[:tur_adi]           }
      attribute(:unit_id)           { integer        object[:kurum_id]          }
      attribute(:unit_name)         { string         object[:kurum_ad]          }
      attribute(:yoksis_id)         { integer        object[:s_id]              }

      attribute :start_date do
        next unless object[:bastar]

        year, month, day = object[:bastar].split('.').reverse
        build_date year, month, day
      end

      attribute :end_date do
        next unless object[:bittar]

        year, month, day = object[:bittar].split('.').reverse
        build_date year, month, day
      end
    end
  end
end
