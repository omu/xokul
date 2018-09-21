# frozen_string_literal: true

module Yoksis
  class MilitaryController < ApplicationController
    before_action :set_military

    include ActionsResource

    def informations
      render_as_json @military.informations(id_number: secure_params.require(:id_number))
    end

    private

    def set_military
      @military = Services::Yoksis::Military.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def secure_params
      params.require(:military).permit(:id_number)
    end
  end
end
