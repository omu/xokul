# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    include ActionsResource

    Services::Yoksis.module::REFERENCES_METHODS.each_key do |method|
      define_method(method) do
        render(
          json: @references.send(method).absolute_data,
          each_serializer: serializer(method)
        )
      end
    end

    def district
      response = @references.district(params.require(:province_code))
      render(
        json: response.absolute_data,
        each_serializer: serializer(:district)
      )
    end

    private

    def set_references
      @references = Services::Yoksis.module::References.new
    end

    def serializer(method)
      "Yoksis::References::#{method.camelize}Serializer"
    end

    def api_version
      Services::Yoksis::VERSION
    end
  end
end
