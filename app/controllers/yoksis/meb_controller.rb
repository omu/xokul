# frozen_string_literal: true

module Yoksis
  class MebController < ApplicationController
    before_action :set_meb

    include ActionsResource
    include YoksisResource

    def students
      render(
        serializer: action_serializer,
        json: @meb.send(action_name, secure_params.require(:id_number))
      )
    end

    private

    def set_meb
      @meb = Services::Yoksis.module::MEB.new
    end

    def secure_params
      params.require(:meb).permit(:id_number, :service_password)
    end
  end
end
