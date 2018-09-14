# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    render json: Services::AVAILABLE_SERVICES
  end
end
