# frozen_string_literal: true

module Yoksis
  class RegistrationsController < ApplicationController
    before_action :set_registrations

    def foundation_tuition
      render(
        json: @registrations.foundation_tuition(
          *params.require(%i[tck_no paid])
        ).absolute,
        serializer: action_serializer
      )
    end

    def query_by_date
      render(
        json: @registrations.query_by_date(
          *params.require(%i[day month year unit_id])
        ).absolute,
        serializer: action_serializer
      )
    end

    def query_by_tck
      render(
        json: @registrations.query_by_tck(
          *params.require(%i[tck_no unit_id])
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
