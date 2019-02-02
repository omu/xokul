# frozen_string_literal: true

module Kps
  class VerificationsController < ApplicationController
    include ActionsResource

    def foreign_nationals
      render_as_json Services::Kps::Verifications.foreign_nationals(
        id_number: foreign_nationals_params.require(:id_number),
        first_name: foreign_nationals_params.require(:first_name),
        last_name: foreign_nationals_params.require(:last_name),
        day_of_birth: foreign_nationals_params.require(:day_of_birth),
        month_of_birth: foreign_nationals_params.require(:month_of_birth),
        year_of_birth: foreign_nationals_params.require(:year_of_birth)
      )
    end

    # rubocop:disable Metrics/AbcSize
    def identity_cards
      render_as_json Services::Kps::Verifications.identity_cards(
        id_number: identity_cards_params.require(:id_number),
        first_name: identity_cards_params.require(:first_name),
        last_name: identity_cards_params.require(:last_name),
        day_of_birth: identity_cards_params.require(:day_of_birth),
        month_of_birth: identity_cards_params.require(:month_of_birth),
        year_of_birth: identity_cards_params.require(:year_of_birth),
        card_serial_code: identity_cards_params.require(:card_serial_code),
        card_number: identity_cards_params.require(:card_number)
      )
    end
    # rubocop:enable Metrics/AbcSize

    def identity_numbers
      render_as_json Services::Kps::Verifications.identity_numbers(
        id_number: identity_numbers_params.require(:id_number),
        first_name: identity_numbers_params.require(:first_name),
        last_name: identity_numbers_params.require(:last_name),
        year_of_birth: identity_numbers_params.require(:year_of_birth)
      )
    end

    private

    def foreign_nationals_params
      params.require(:verification).permit(
        :id_number, :first_name, :last_name, :day_of_birth, :month_of_birth,
        :year_of_birth
      )
    end

    def identity_cards_params
      params.require(:verification).permit(
        :id_number, :first_name, :last_name, :day_of_birth, :month_of_birth,
        :year_of_birth, :card_serial_code, :card_number
      )
    end

    def identity_numbers_params
      params.require(:verification).permit(
        :id_number, :first_name, :last_name, :year_of_birth
      )
    end
  end
end
