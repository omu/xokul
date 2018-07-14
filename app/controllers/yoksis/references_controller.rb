# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    # Test
    def district
      response = @references.district(params[:province_code])
      render(
        json: response.collection(:ilce_kodlari),
        each_serializer: Yoksis::References::DistrictSerializer
      )
    end

    private

    def set_references
      @references = references_klass.new
    end

    # Must be a concern in the future
    def references_klass
      "Services::Yoksis::#{version}::References".constantize
    end

    def version
      Services::Yoksis::VERSION.upcase
    end
  end
end
