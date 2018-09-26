# frozen_string_literal: true

module Yoksis
  class ResumesController < ApplicationController
    before_action :set_client_variables, :set_resumes

    include ActionsResource

    # TODO: Fix stylistic issues

    def citations
      render_as_json @resumes.citations(
        id_number: secure_params.require(:id_number), year: secure_params.require(:year)
      )
    end

    def papers
      render_as_json @resumes.papers(id_number: secure_params.require(:id_number))
    end

    def academic_duties
      render_as_json @resumes.academic_duties(id_number: secure_params.require(:id_number))
    end

    def administrative_duties
      render_as_json @resumes.administrative_duties(id_number: secure_params.require(:id_number))
    end

    def lectures
      render_as_json @resumes.lectures(id_number: secure_params.require(:id_number))
    end

    def articles
      render_as_json @resumes.send(action_name, id_number: secure_params.require(:id_number))
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
