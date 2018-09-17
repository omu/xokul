# frozen_string_literal: true

module Kps
  class VerificationsController < ApplicationController
    before_action :set_verifications

    include ActionsResource

    def identities
      render_as_json @verifications.identities(
        id_number:     identities_params.require(:id_number),
        first_name:    identities_params.require(:first_name),
        last_name:     identities_params.require(:last_name),
        year_of_birth: identities_params.require(:year_of_birth)
      )
    end

    private

    def set_verifications
      @verifications = Services::Kps::Verifications.new
    end

    def identities_params
      params.require(:verification).permit(
        :id_number, :first_name, :last_name, :year_of_birth
      )
    end
  end
end
