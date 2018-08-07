# frozen_string_literal: true

module Yoksis
  class MebController < ApplicationController
    before_action :set_meb

    include ActionsResource
    include YoksisResource

    def graduation_data
      response = @meb.send(
        action_name,
        params.require(:tck_no), service_password: params[:service_password]
      )
      render(
        json: response.absolute,
        serializer: "Yoksis::Meb::#{action_name.camelize}Serializer".constantize
      )
    end

    alias detailed_graduation_data graduation_data

    private

    def set_meb
      @meb = Services::Yoksis.module::MEB.new
    end
  end
end