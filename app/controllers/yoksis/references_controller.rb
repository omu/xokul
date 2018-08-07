# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    include ActionsResource
    include YoksisResource

    Services::Yoksis.module::REFERENCES_METHODS.each_key do |method|
      define_method(method) do
        render(
          json: @references.send(method).absolute,
          each_serializer: serializer(method)
        )
      end
    end

    def district
      response = @references.district(params.require(:province_code))
      render(
        json: response.absolute,
        each_serializer: serializer(:district)
      )
    end

    private

    def set_references
      @references = Services::Yoksis.module::References.new
    end

    def serializer(method)
      "Yoksis::References::#{method.camelize}Serializer".constantize
    end
  end
end
