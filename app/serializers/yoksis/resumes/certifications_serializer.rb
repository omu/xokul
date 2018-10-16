# frozen_string_literal: true

module Yoksis
  module Resumes
    class CertificationsSerializer < Serializer
      attribute(:registry_id)            { integer        object[:s_id]              }
      attribute(:name)                   { string         object[:adi]               }
      attribute(:content)                { string         object[:icerik]            }
      attribute(:type_id)                { integer        object[:tur_id]            }
      attribute(:type_name)              { string         object[:tur_adi]           }
      attribute(:place)                  { string         object[:yer]               }
      attribute(:scope_id)               { integer        object[:kapsam]            }
      attribute(:scope_name)             { string         object[:kapsam_ad]         }
      attribute(:stint)                  { integer        object[:sure]              }
      attribute(:title_id)               { integer        object[:unvan_id]          }
      attribute(:title_name)             { string         object[:unvan_ad]          }
      attribute(:institution_id)         { integer        object[:kurum_id]          }
      attribute(:institution_name)       { string         object[:kurum_ad]          }
      attribute(:number_of_person)       { integer        object[:kisi_sayisi]       }
      attribute(:country)                { string         object[:ulke_sehir]        }
      attribute(:active_or_passive_id)   { integer        object[:aktif_pasif]       }
      attribute(:active_or_passive_name) { string         object[:aktif_pasif_ad]    }
      attribute(:incentive_points)       { float          object[:tesv_puan]         }
      attribute(:date_of_update)         { parse_datetime object[:guncelleme_tarihi] }

      attribute :date_of_start do
        next unless object[:bastar]

        year, month, day = object[:bastar].split('.').reverse
        build_date year, month, day
      end

      attribute :date_of_end  do
        next unless object[:bittar]

        year, month, day = object[:bittar].split('.').reverse
        build_date year, month, day
      end
    end
  end
end
