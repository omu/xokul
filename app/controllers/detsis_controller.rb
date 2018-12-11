# frozen_string_literal: true

class DetsisController < ApplicationController
  before_action :set_detsis

  include ActionsResource

  def units
    render_as_json @detsis.units
  end

  private

  def set_detsis
    @detsis = Services::Detsis.new(
      Rails.application.credentials.detsis[:username],
      Rails.application.credentials.detsis[:password]
    )
  end
end
