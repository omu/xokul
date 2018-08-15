# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    include ActionsResource
    include YoksisResource

    Services::Yoksis.module::REFERENCES_METHODS.each_key do |method|
      define_method(method) do
        render(
          each_serializer: action_serializer,
          json: @references.send(method)
        )
      end
    end

    def districts
      render(
        each_serializer: action_serializer,
        json: @references.districts(secure_params.require(:city_code))
      )
    end

    private

    def set_references
      @references = Services::Yoksis.module::References.new
    end

    def secure_params
      params.require(:reference).permit(:city_code)
    end
  end
end
