# frozen_string_literal: true

module Yoksis
  class MebController < ApplicationController
    before_action :set_meb

    include ActionsResource
    include YoksisResource

    def grad_informations
      render(
        serializer: action_serializer,
        json: @meb.send(
          action_name,
          params.permit(:id_number, :service_password).require(:id_number)
        )
      )
    end

    alias detailed_grad_informations grad_informations

    private

    def set_meb
      @meb = Services::Yoksis.module::MEB.new
    end
  end
end
