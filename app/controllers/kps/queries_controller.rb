# frozen_string_literal: true

module Kps
  class QueriesController < ApplicationController
    before_action :set_queries

    include ActionsResource

    def addresses
      render_as_json @queries.addresses(id_number: secure_params.require(:id_number))
    end

    def identities
      render_as_json @queries.identities(id_number: secure_params.require(:id_number))
    end

    private

    def set_queries
      @queries = Services::Kps::Queries.new
    end

    def secure_params
      params.require(:query).permit(:id_number)
    end
  end
end
