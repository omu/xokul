# frozen_string_literal: true

module Yoksis
  class ResumesController < ApplicationController
    before_action :set_client_variables, :set_resumes

    include ActionsResource

    def articles
      render_as_json @resumes.send(action_name, id_number: secure_params.require(:id_number))
    end

    def authors
      render_as_json @resumes.authors(
        id_number: secure_params.require(:id_number), author_id: secure_params.require(:author_id)
      )
    end

    def citations
      render_as_json @resumes.send(
        action_name,
        id_number: secure_params.require(:id_number), year: secure_params.require(:year)
      )
    end

    alias academic_duties        articles
    alias academic_links         articles
    alias administrative_duties  articles
    alias artistic_activities    articles
    alias awards                 articles
    alias books                  articles
    alias certifications         articles
    alias editorships            articles
    alias education_informations articles
    alias designs                articles
    alias fields                 articles
    alias foreign_languages      articles
    alias lectures               articles
    alias memberships            articles
    alias other_experiences      articles
    alias papers                 articles
    alias patents                articles
    alias projects               articles
    alias refereeing             articles
    alias thesis_advisors        articles

    alias incentive_applications citations
    alias incentive_activity_declarations citations

    private

    def set_client_variables
      @username = Rails.application.credentials.yoksis[:username]
      @password = Rails.application.credentials.yoksis[:password]
    end

    def set_resumes
      @resumes = Services::Yoksis::Resumes.new(basic_auth: [@username, @password])
    end

    def secure_params
      params.require(:resume).permit(:id_number, :year, :author_id)
    end
  end
end
