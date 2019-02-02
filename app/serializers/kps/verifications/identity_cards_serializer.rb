# frozen_string_literal: true

module Kps
  module Verifications
    class IdentityCardsSerializer < Serializer
      attribute(:status) { object[:kisi_ve_cuzdan_dogrula_result] }
    end
  end
end
