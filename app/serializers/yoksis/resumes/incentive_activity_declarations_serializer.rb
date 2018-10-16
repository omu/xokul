# frozen_string_literal: true

module Yoksis
  module Resumes
    class IncentiveActivityDeclarationsSerializer < Serializer
      attribute(:registry_id)    { integer        object[:fb_id]             }
      attribute(:type_id)        { integer        object[:tur]               }
      attribute(:type_name)      { string         object[:tur_ad]            }
      attribute(:work_id)        { integer        object[:eser_id]           }
      attribute(:work_type_id)   { integer        object[:eser_tur]          }
      attribute(:work_type_name) { string         object[:eser_tur_ad]       }
      attribute(:date_of_update) { parse_datetime object[:guncelleme_tarihi] }
    end
  end
end
