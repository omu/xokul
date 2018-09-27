# frozen_string_literal: true

module Yoksis
  module Resumes
    class IncentiveApplicationsSerializer < Serializer
      attribute(:id)                        { object[:basvuru_id].safe_to_i                                      }
      attribute(:term_id)                   { object[:donem_id].safe_to_i                                        }
      attribute(:term_name)                 { object[:donem_ad].titleize_tr                                      }
      attribute(:date_of_application)       { object[:basvuru_tarihi] && Date.parse(object[:basvuru_tarihi])     }
      attribute(:date_of_final_application) { object[:son_islem_tarihi] && Date.parse(object[:son_islem_tarihi]) }
    end
  end
end
