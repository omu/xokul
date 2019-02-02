# frozen_string_literal: true

module Kps
  module Verifications
    class IdentityNumbersSerializer < Serializer
      attribute(:status) { object[:tc_kimlik_no_dogrula_result] }
    end
  end
end
