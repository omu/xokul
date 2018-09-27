# frozen_string_literal: true

module Yoksis
  class ResumesController < ApplicationController
    before_action :set_client_variables, :set_resumes

    include ActionsResource

    UNDEFINABLE_ACTIONS_IN_ITERATION = %i[
      authors
      citations
      incentive_applications
      incentive_activity_declarations
    ].freeze
    private_constant :UNDEFINABLE_ACTIONS_IN_ITERATION

    Services::Yoksis::Resumes::ARGS.each_key do |method|
      next if method.in?(UNDEFINABLE_ACTIONS_IN_ITERATION)

      define_method(method) do
        render_as_json @resumes.send(
          method, id_number: undefinable_actions_in_iteration_params.require(:id_number)
        )
      end
    end

    def authors
      render_as_json @resumes.authors(
        id_number: authors_params.require(:id_number), author_id: authors_params.require(:author_id)
      )
    end

    def citations
      render_as_json @resumes.send(
        action_name,
        id_number: citations_params.require(:id_number), year: citations_params.require(:year)
      )
    end

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

    def undefinable_actions_in_iteration_params
      params.require(:resume).permit(:id_number)
    end

    def authors_params
      params.require(:resume).permit(:id_number, :author_id)
    end

    def citations_params
      params.require(:resume).permit(:id_number, :year)
    end
  end
end
