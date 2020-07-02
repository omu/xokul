# frozen_string_literal: true

module Yoksis
  class ProspectivesController < ApplicationController
    include ActionsResource

    # rubocop:disable Metrics/MethodLength
    def students
      r = if prospectives_params[:id_number].present?
            student_details
          else
            registration_type = prospectives_params[:registration_type]&.to_sym
            case registration_type
            when :online
              online_registered_students
            when :manual
              manual_registered_students
            else
              prospectives.students(**common_params)
            end
          end

      render_as_json r
    end
    # rubocop:enable Metrics/MethodLength

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
      params.require(:prospective).permit(:type, :year, :online, :id_number, :registration_type, :page, :per_page)
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

    def online_registered_students
      prospectives.students(common_params.merge(online: true))
    end

    def manual_registered_students
      prospectives.students(common_params.merge(online: false))
    end

    def student_details
      prospectives.student(
        prospectives_params[:id_number],
        prospectives_params[:type],
        prospectives_params[:year]
      )
    end
  end
end
