# frozen_string_literal: true

module Osym
  class ExaminationController < ApplicationController
    before_action :set_examination

    include ActionsResource

    def groups
      render_as_json @examination.groups
    end

    def result_informations
      render_as_json @examination.result_informations(
        id_number: secure_params.require(:id_number),
        year: secure_params.require(:year),
        group_id: secure_params.require(:group_id)
      )
    end

    private

    def set_examination
      @examination = Services::Osym::Examination.new(
        Rails.application.credentials.osym[:username],
        Rails.application.credentials.osym[:password]
      )
    end

    def secure_params
      params.require(:examination).permit(:id_number, :year, :group_id)
    end
  end
end
