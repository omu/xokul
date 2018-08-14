# frozen_string_literal: true

module Yoksis
  class GraduationsController < ApplicationController
    before_action :set_graduations

    include ActionsResource
    include YoksisResource

    def students
      render(
        json: @graduations.students(params.require(:id_number)),
        serializer: action_serializer
      )
    end

    private

    def set_graduations
      @graduations = Services::Yoksis.module::Graduations.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end
  end
end
