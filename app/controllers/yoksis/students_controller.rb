# frozen_string_literal: true

module Yoksis
  class StudentsController < ApplicationController
    before_action :set_students

    include ActionsResource
    include YoksisResource

    def personal_informations
      render(
        serializer: action_serializer,
        json: @students.send(action_name, secure_params.require(:id_number))
      )
    end

    alias studentship_informations personal_informations
    alias undergrad_transfer_informations personal_informations
    alias unit_informations personal_informations

    private

    def set_students
      @students = Services::Yoksis.module_path::Students.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def secure_params
      p params
      params.require(:student).permit(:id_number)
    end
  end
end
