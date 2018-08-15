# frozen_string_literal: true

module Yoksis
  class RegistrationsController < ApplicationController
    before_action :set_registrations

    include ActionsResource
    include YoksisResource

    def foundation_tuitions
      render(
        serializer: action_serializer,
        json: @registrations.foundation_tuitions(
          *foundation_tuitions_params.require(%i[id_number paid])
        )
      )
    end

    def queries_by_date
      render(
        serializer: action_serializer,
        json: @registrations.queries_by_date(
          *queries_by_date_params.require(%i[day month year unit_id])
        )
      )
    end

    def queries_by_id_number
      render(
        serializer: action_serializer,
        json: @registrations.queries_by_id_number(
          *queries_by_id_number_params.require(%i[id_number unit_id])
        )
      )
    end

    private

    def set_registrations
      @registrations = Services::Yoksis.module::Registrations.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def foundation_tuitions_params
      params.require(:registration).permit(:id_number, :paid)
    end

    def queries_by_date_params
      params.require(:registration).permit(:day, :month, :year, :unit_id)
    end

    def queries_by_id_number_params
      params.require(:registration).permit(:id_number, :unit_id)
    end
  end
end
