# frozen_string_literal: true

module Kps
  module Verifications
    class ForeignNationalsSerializer < Serializer
      attribute(:status) { object[:yabanci_kimlik_no_dogrula_result] }
    end
  end
end
