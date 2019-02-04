# frozen_string_literal: true

module Kps
  class VerificationsController < ApplicationController
    include ActionsResource

    # rubocop:disable Metrics/AbcSize
    def id_cards
      render_as_json Services::Kps::Verifications.id_cards(
        id_number: id_cards_params.require(:id_number),
        first_name: id_cards_params.require(:first_name),
        last_name: id_cards_params.require(:last_name),
        day_of_birth: id_cards_params.require(:day_of_birth),
        month_of_birth: id_cards_params.require(:month_of_birth),
        year_of_birth: id_cards_params.require(:year_of_birth),
        card_serial: id_cards_params[:card_serial],
        card_number: id_cards_params[:card_number],
        tckk_serial: id_cards_params[:tckk_serial]
      )
    end
    # rubocop:enable Metrics/AbcSize

    def id_numbers
      render_as_json Services::Kps::Verifications.id_numbers(
        id_number: id_numbers_params.require(:id_number),
        first_name: id_numbers_params.require(:first_name),
        last_name: id_numbers_params.require(:last_name),
        year_of_birth: id_numbers_params.require(:year_of_birth)
      )
    end

    private

    def id_cards_params
      params.require(:verification).permit(
        :id_number, :first_name, :last_name, :day_of_birth, :month_of_birth,
        :year_of_birth, :card_serial, :card_number, :tckk_serial
      )
    end

    def id_numbers_params
      params.require(:verification).permit(
        :id_number, :first_name, :last_name, :year_of_birth
      )
    end
  end
end
