# frozen_string_literal: true

module Yoksis
  class StaffController < ApplicationController
    include ActionsResource
    include Pagy::Backend

    def academicians
      render_as_json Academician.find_by(tc_kimlik_no: academicians_params[:id_number])
    end

    def nationalities
      render_as_json Nationality.all.as_json.map(&:symbolize_keys)
    end

    def pages
      _, records = pagy(Academician.all, page: pages_params[:page])
      render_as_json records.as_json.map(&:symbolize_keys)
    end

    def total_pages
      pagy, _ = pagy(Academician.all)
      render_as_json pagy.pages
    end

    private

    def academicians_params
      params.require(:staff).permit(:id_number)
    end

    def pages_params
      params.require(:staff).permit(:page)
    end
  end
end
