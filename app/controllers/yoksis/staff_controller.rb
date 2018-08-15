# frozen_string_literal: true

module Yoksis
  class StaffController < ApplicationController
    before_action :set_staff

    include ActionsResource
    include YoksisResource

    def lists
      render(
        each_serializer: action_serializer,
        json: @staff.lists(
          Rails.application.credentials.yoksis[:client_id],
          lists_params.require(:page)
        )
      )
    end

    def nationalities
      render(
        each_serializer: action_serializer,
        json: @staff.nationalities
      )
    end

    def pages
      render(
        serializer: action_serializer,
        json: @staff.pages(Rails.application.credentials.yoksis[:client_id])
      )
    end

    def profiles
      render(
        serializer: action_serializer,
        json: @staff.profiles(
          Rails.application.credentials.yoksis[:client_id],
          profiles_params.require(:id_number)
        )
      )
    end

    private

    def set_staff
      @staff = Services::Yoksis.module::Staff.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def lists_params
      params.require(:staff).permit(:page)
    end

    def profiles_params
      params.require(:staff).permit(:id_number)
    end
  end
end
