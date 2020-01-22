# frozen_string_literal: true

class DetsisController < ApplicationController
  before_action :set_detsis

  include ActionsResource

  def active_kep_addresses
    render_as_json @detsis.active_kep_addresses
  end

  def parent_establishments
    render_as_json @detsis.parent_establishments
  end

  def parent_establishments_budget_types
    render_as_json @detsis.parent_establishments_budget_types
  end

  def parent_establishments_contacts
    render_as_json @detsis.parent_establishments_contacts
  end

  def officiers
    render_as_json @detsis.officiers
  end

  def place_codes
    render_as_json @detsis.place_codes
  end

  def type_one_codes
    render_as_json @detsis.type_one_codes
  end

  def type_two_codes
    render_as_json @detsis.type_two_codes
  end

  def sdp_codes
    render_as_json @detsis.sdp_codes sdp_codes_params[:administrative_identity_code]
  end

  def sdp_code_references
    render json: @detsis.sdp_code_references
  end

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

  def sdp_codes_params
    params.require(:detsi).permit(:administrative_identity_code)
  end
end
