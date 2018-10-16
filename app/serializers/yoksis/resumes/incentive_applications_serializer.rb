# frozen_string_literal: true

module Yoksis
  module Resumes
    class IncentiveApplicationsSerializer < Serializer
      attribute(:application_id)            { integer    object[:basvuru_id]       }
      attribute(:term_id)                   { integer    object[:donem_id]         }
      attribute(:term_name)                 { string     object[:donem_ad]         }
      attribute(:date_of_application)       { parse_date object[:basvuru_tarihi]   }
      attribute(:date_of_final_application) { parse_date object[:son_islem_tarihi] }
    end
  end
end
