# frozen_string_literal: true

module Kps
  module Verifications
    class IdCardsSerializer < Serializer
      attribute(:status) { object }
    end
  end
end
