# frozen_string_literal: true

module Osym
  module Examination
    class ResultInformationsSerializer < ActiveModel::Serializer
      attribute(:id)              { object[:id].safe_to_i    }
      attribute(:name)            { object[:ad]              }
      attribute(:date_of_release) { object[:aciklama_tarihi] }
    end
  end
end
