# frozen_string_literal: true

module Yoksis
  module Boolean; end
  class MebController < ApplicationController
    before_action :set_meb

    include ActionsResource
    include YoksisResource

    def graduation_data
      render(
        json: @meb.send(method, params.require(:id_number)).absolute,
        serializer: action_serializer
      )
    end

    private

    def set_meb
      @meb = Services::Yoksis.module::MEB.new
    end
  end
end
