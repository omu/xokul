# frozen_string_literal: true

module Yoksis
  class RegistrationsController < ApplicationController
    before_action :set_registrations

    include ActionsResource
    include YoksisResource

    # TODO: Populate its serializer based on what yoksis returns
    def foundation_tuitions
      render(
        serializer: action_serializer,
        json: @registrations.foundation_tuitions(
          *params.permit(:id_number, :paid).require(%i[id_number paid])
        )
      )
    end

    # TODO: Populate its serializer based on what yoksis returns
    def queries_by_date
      render(
        serializer: action_serializer,
        json: @registrations.queries_by_date(
          *params.permit(:day, :month, :year, :unit_id).require(%i[day month year unit_id])
        )
      )
    end

    # TODO: Populate its serializer based on what yoksis returns
    def queries_by_id_number
      render(
        serializer: action_serializer,
        json: @registrations.queries_by_id_number(
          *params.permit(:id_number, :unit_id).require(%i[id_number unit_id])
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
  end
end
