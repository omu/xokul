# frozen_string_literal: true

module Yoksis
  module Resumes
    class IncentiveActivityDeclarationsSerializer < Serializer
      attribute(:id)             { object[:fb_id].safe_to_i                                                  }
      attribute(:type_id)        { object[:tur].safe_to_i                                                    }
      attribute(:type_name)      { object[:tur_ad].titleize_tr                                               }
      attribute(:work_id)        { object[:eser_id].safe_to_i                                                }
      attribute(:work_type_id)   { object[:eser_tur].safe_to_i                                               }
      attribute(:work_type_name) { object[:eser_tur_ad].titleize_tr                                          }
      attribute(:date_of_update) { object[:guncelleme_tarihi] && Time.zone.parse(object[:guncelleme_tarihi]) }
    end
  end
end
