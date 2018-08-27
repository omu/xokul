# frozen_string_literal: true

module Yoksis
  class ResumesController < ApplicationController
    before_action :set_resumes

    include ActionsResource
    include YoksisResource

    def certifications
      render(
        each_serializer: action_serializer,
        json: [@resumes.send(
          action_name,
          Rails.application.credentials.yoksis[:username],
          Rails.application.credentials.yoksis[:password],
          secure_params.require(:id_number)
        )].flatten
      )
    end

    alias projects certifications
    alias articles certifications

    private

    def set_resumes
      @resumes = Services::Yoksis.module_path::Resumes.new(
        Rails.application.credentials.yoksis[:username],
        Rails.application.credentials.yoksis[:password]
      )
    end

    def secure_params
      params.require(:resume).permit(:id_number)
    end
  end
end
