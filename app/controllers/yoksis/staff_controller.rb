# frozen_string_literal: true

module Yoksis
  class StaffController < ApplicationController
    before_action :set_staff

    include ActionsResource
    include YoksisResource

    def academicians
      if secure_params[:id_number].present?
        render_academicians_by_id_number
      else
        render_academicians_by_page
      end
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
      @staff = Services::Yoksis.module_path::Staff.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def secure_params
      params.require(:staff).permit(:id_number, :page)
    end

    def render_academicians_by_id_number
      render(
        serializer: action_serializer,
        json: @staff.academicians_by_id_number(
          Rails.application.credentials.yoksis[:client_id],
          secure_params[:id_number]
        )
      )
    end

    def render_academicians_by_page
      render(
        each_serializer: action_serializer,
        json: @staff.academicians_by_page(
          Rails.application.credentials.yoksis[:client_id],
          secure_params[:page]
        )
      )
    end
  end
end
