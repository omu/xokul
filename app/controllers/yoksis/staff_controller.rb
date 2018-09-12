# frozen_string_literal: true

module Yoksis
  class StaffController < ApplicationController
    before_action :set_client_variables, :set_staff

    include ActionsResource
    include YoksisResource

    def academicians
      render_as_json @staff.academicians(querier: @client_id, queried: secure_params[:id_number])
    end

    def nationalities
      render_as_json @staff.nationalities
    end

    def pages
      render_as_json @staff.pages(querier: @client_id, page: secure_params[:page])
    end

    private

    def set_client_variables
      @client_id = Rails.application.credentials.yoksis[:client_id]
      @client_secret = Rails.application.credentials.yoksis[:client_secret]
    end

    def set_staff
      @staff = Services::Yoksis::Staff.new(@client_id, @client_secret)
    end

    def secure_params
      params.require(:staff).permit(:id_number, :page)
    end
  end
end
