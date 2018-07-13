# frozen_string_literal: true

module Yoksis
  class UnitsController < ApplicationController
    def universities
      version = Services::YOKSIS::VERSION
      klass = "Services::YOKSIS::#{version.upcase}::Units".constantize
      units = klass.new
      render json: units.universities.to_json
    end
  end
end
