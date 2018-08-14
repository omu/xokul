# frozen_string_literal: true

module Yoksis
  class RegistrationsController < ApplicationController
    before_action :set_registrations

    include ActionsResource
    include YoksisResource

    # TODO: Populate its serializer based on what yoksis returns
    def foundation_tuitions
      render(
        json: @registrations.foundation_tuitions(
          *params.require(%i[id_number paid])
        ).absolute,
        serializer: action_serializer
      )
    end

    # TODO: Populate its serializer based on what yoksis returns
    def queries_by_date
      render(
        json: @registrations.queries_by_date(
          *params.require(%i[day month year unit_id])
        ).absolute,
        serializer: action_serializer
      )
    end

    # TODO: Populate its serializer based on what yoksis returns
    def queries_by_id_number
      render(
        json: @registrations.queries_by_id_number(
          *params.require(%i[id_number unit_id])
        ).absolute,
        serializer: action_serializer
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
