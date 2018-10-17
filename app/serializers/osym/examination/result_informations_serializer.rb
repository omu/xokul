# frozen_string_literal: true

module Osym
  module Examination
    class ResultInformationsSerializer < ActiveModel::Serializer
      attribute(:id)           { integer    object[:id]              }
      attribute(:name)         { string     object[:ad]              }
      attribute(:release_date) { parse_date object[:aciklama_tarihi] }
    end
  end
end
