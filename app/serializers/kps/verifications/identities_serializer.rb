# frozen_string_literal: true

module Kps
  module Verifications
    class IdentitiesSerializer < Serializer
      attribute(:status) { object[:tc_kimlik_no_dogrula_result] }
    end
  end
end
