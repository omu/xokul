# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    include ActionsResource
    include YoksisResource

    Services::Yoksis.module::REFERENCES_METHODS.each_key do |method|
      define_method(method) do
        render(
          json: @references.send(method),
          each_serializer: action_serializer
        )
      end
    end

    def districts
      render(
        json: @references.districts(params.require(:city_code)),
        each_serializer: action_serializer
      )
    end

    private

    def set_references
      @references = Services::Yoksis.module::References.new
    end
  end
end
