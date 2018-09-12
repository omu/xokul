# frozen_string_literal: true

module Yoksis
  class StudentsController < ApplicationController
    before_action :set_students

    include ActionsResource
    include YoksisResource

    def informations
      render_as_json @students.send(action_name, id_number: secure_params.require(:id_number))
    end

    private

    def set_students
      @students = Services::Yoksis::Students.new(
        Rails.application.credentials.yoksis[:client_id],
        Rails.application.credentials.yoksis[:client_secret]
      )
    end

    def secure_params
      params.require(:student).permit(:id_number)
    end
  end
end
