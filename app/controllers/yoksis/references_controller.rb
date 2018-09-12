# frozen_string_literal: true

module Yoksis
  class ReferencesController < ApplicationController
    before_action :set_references

    include ActionsResource
    include YoksisResource

    Services::Yoksis::References::METHOD_VARIABLES.each_key do |method|
      define_method(method) { render_as_json @references.send(method) }
    end

    def districts
      render_as_json @references.districts(city_code: secure_params.require(:city_code))
    end

    private

    def set_references
      @references = Services::Yoksis::References.new
    end

    def secure_params
      params.require(:reference).permit(:city_code)
    end
  end
end
