# frozen_string_literal: true

module Yoksis
  class ResumesController < ApplicationController
    before_action :set_client_variables, :set_resumes

    include ActionsResource

    def certifications
      render_as_json @resumes.send(
        action_name,
        username:  @username,
        password:  @password,
        id_number: secure_params.require(:id_number)
      )
    end

    alias projects certifications
    alias articles certifications

    private

    def set_client_variables
      @username = Rails.application.credentials.yoksis[:username]
      @password = Rails.application.credentials.yoksis[:password]
    end

    def set_resumes
      @resumes = Services::Yoksis::Resumes.new(basic_auth: [@username, @password])
    end

    def secure_params
      params.require(:resume).permit(:id_number)
    end
  end
end
