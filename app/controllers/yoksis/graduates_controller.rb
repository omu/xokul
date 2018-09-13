# frozen_string_literal: true

module Yoksis
  class GraduatesController < ApplicationController
    before_action :set_graduations

    include ActionsResource
    include YoksisResource

    def informations
      render_as_json @graduations.informations(id_number: secure_params.require(:id_number))
    end

    private

    def set_graduations
      @graduations = Services::Yoksis::Graduates.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def secure_params
      params.require(:graduate).permit(:id_number)
    end
  end
end
