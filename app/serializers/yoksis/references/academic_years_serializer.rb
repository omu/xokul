# frozen_string_literal: true

module Yoksis
  module References
    class AcademicYearsSerializer < BaseSerializer
      attribute(:description) { string object[:aciklama] }
    end
  end
end
