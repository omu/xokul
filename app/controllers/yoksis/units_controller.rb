# frozen_string_literal: true

module Yoksis
  class UnitsController < ApplicationController
    before_action :set_units

    include ActionsResource
    include YoksisResource

    def changes
      render(
        serializer: action_serializer,
        json: @units.changes(*changes_params.require(%i[day month year]))
      )
    end

    def subunits
      render(
        serializer: action_serializer,
        json: @units.subunits(unit_params.require(:unit_id))
      )
    end

    def programs
      render(
        serializer: action_serializer,
        json: @units.programs(unit_params.require(:unit_id))
      )
    end

    def universities
      render(
        each_serializer: action_serializer,
        json: @units.universities
      )
    end

    private

    def set_units
      @units = Services::Yoksis.module_path::Units.new
    end

    def changes_params
      params.require(:unit).permit(:day, :month, :year)
    end

    def unit_params
      params.require(:unit).permit(:unit_id)
    end
  end
end
