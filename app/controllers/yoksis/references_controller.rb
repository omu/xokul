# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    # rubocop:disable Naming/ConstantName
    ReferencesVersion = Services::Yoksis::VERSION.upcase
    ReferencesClass   = "Services::Yoksis::#{ReferencesVersion}::References".constantize
    # rubocop:enable Naming/ConstantName

    ReferencesClass::REFERENCES_METHODS.each_key do |method|
      define_method(method) do
        serializer = "#{method.to_s.camelize}Serializer"
        request = @references.send(method)
        render(
          json: request.response,
          each_serializer: "Yoksis::References::#{serializer}".constantize
        )
      end
    end

    def district
      request = @references.district(params.require(:province_code))
      render(
        json: request.response,
        each_serializer: Yoksis::References::DistrictSerializer
      )
    end

    private

    def set_references
      @references = ReferencesClass.new
    end
  end
end
