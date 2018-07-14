# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    rescue_from(Service::HTTPError, Service::SOAPError) do |error|
      render json: error, each_serializer: ErrorSerializer
    end

    # Test
    def district
      response = @references.district(params.require(:province_code))
      render(
        json: response.collection(:ilce_kodlari),
        each_serializer: Yoksis::References::DistrictSerializer
      )
    end

    private

    def set_references
      @references = references_klass.new
    end

    # Must be a concern in the futur  e
    def references_klass
      "Services::Yoksis::#{version}::References".constantize
    end

    def version
      Services::Yoksis::VERSION.upcase
    end
  end
end
