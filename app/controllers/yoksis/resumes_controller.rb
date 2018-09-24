# frozen_string_literal: true

module Yoksis
  class ResumesController < ApplicationController
    before_action :set_client_variables, :set_resumes

    include ActionsResource

    def citations
      render_as_json @resumes.citations(
        id_number: secure_params.require(:id_number),
        year: secure_params.require(:year)
      )
    end

    def articles
      render_as_json @resumes.send(
        action_name, id_number: secure_params.require(:id_number)
      )
    end

    alias certifications articles
    alias projects articles

    private

    def set_client_variables
      @username = Rails.application.credentials.yoksis[:username]
      @password = Rails.application.credentials.yoksis[:password]
    end

    def set_resumes
      @resumes = Services::Yoksis::Resumes.new(basic_auth: [@username, @password])
    end

    def secure_params
      params.require(:resume).permit(:id_number, :year)
    end
  end
end
