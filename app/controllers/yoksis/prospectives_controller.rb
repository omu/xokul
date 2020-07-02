# frozen_string_literal: true

module Yoksis
  class ProspectivesController < ApplicationController
    include ActionsResource

    # rubocop:disable Metrics/AbcSize
    def students
      r = if prospectives_params[:id_number].present?
            prospectives.student(
              prospectives_params[:id_number],
              prospectives_params[:type],
              prospectives_params[:year]
            )
          else
            prospectives.students(**common_params)
          end

      render_as_json r
    end
    # rubocop:enable Metrics/AbcSize

    def through_electronic
      r = prospectives.students(common_params.merge(online: true))
      render_as_json r
    end

    def without_electronics
      r = prospectives.students(common_params.merge(online: false))
      render_as_json r
    end

    def photo
      r = prospectives.photo(prospectives_params[:id_number])
      render json: { image: r }
    end

    private

    def prospectives
      @prospectives ||= Services::Yoksis::Prospectives.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def prospectives_params
      params.require(:prospective).permit(:type, :year, :online, :id_number, :page, :per_page)
    end

    def common_params
      q = {
        type: prospectives_params[:type],
        year: prospectives_params[:year]
      }

      q[:page] = params[:page] if params[:page]
      q[:per_page] = params[:per_page] if params[:per_page]

      q
    end
  end
end
