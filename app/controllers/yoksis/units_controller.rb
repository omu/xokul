# frozen_string_literal: true

module Yoksis
  class UnitsController < ApplicationController
    before_action :set_units

    include ActionsResource

    def changes
      day, month, year = *changes_params.require(%i[day month year])
      render_as_json @units.changes(day: day, month: month, year: year)
    end

    def names
      render_as_json @units.names(unit_id: unit_params.require(:unit_id))
    end

    def universities
      render_as_json @units.universities
    end

    def programs
      render_as_json @units.programs(unit_id: unit_params.require(:unit_id))
    end

    def subunits
      render_as_json @units.subunits(unit_id: unit_params.require(:unit_id))
    end

    private

    def set_units
      @units = Services::Yoksis::Units.new(
        basic_auth: [
          Rails.application.credentials.yoksis[:client_id],
          Rails.application.credentials.yoksis[:client_secret]
        ]
      )
    end

    def changes_params
      params.require(:unit).permit(:day, :month, :year)
    end

    def unit_params
      params.require(:unit).permit(:unit_id)
    end
  end
end
