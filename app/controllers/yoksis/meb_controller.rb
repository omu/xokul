# frozen_string_literal: true

module Yoksis
  module Boolean; end
  class MebController < ApplicationController
    before_action :set_meb

    include ActionsResource
    include YoksisResource

    def grad_informations
      render(
        json: @meb.send(action_name, params.require(:id_number)).absolute,
        serializer: action_serializer
      )
    end

    alias detailed_grad_informations grad_informations

    private

    def set_meb
      @meb = Services::Yoksis.module::MEB.new
    end
  end
end
