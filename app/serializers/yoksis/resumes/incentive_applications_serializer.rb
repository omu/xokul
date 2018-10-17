# frozen_string_literal: true

module Yoksis
  module Resumes
    class IncentiveApplicationsSerializer < Serializer
      attribute(:date)        { parse_date object[:basvuru_tarihi]   }
      attribute(:id)          { integer    object[:basvuru_id]       }
      attribute(:last_update) { parse_date object[:son_islem_tarihi] }
      attribute(:term_id)     { integer    object[:donem_id]         }
      attribute(:term_name)   { string     object[:donem_ad]         }
    end
  end
end
