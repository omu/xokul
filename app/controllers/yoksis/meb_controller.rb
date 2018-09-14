# frozen_string_literal: true

module Yoksis
  class MebController < ApplicationController
    before_action :set_meb

    include ActionsResource

    def students
      render_as_json @meb.students(id_number: secure_params.require(:id_number))
    end

    private

    def set_meb
      @meb = Services::Yoksis::MEB.new
    end

    def secure_params
      params.require(:meb).permit(:id_number)
    end
  end
end
