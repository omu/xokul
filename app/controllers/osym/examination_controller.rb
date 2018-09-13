# frozen_string_literal: true

module Osym
  class ExaminationController < ApplicationController
    before_action :set_examination

    include ActionsResource
    include OsymResource

    def groups
      render_as_json @examination.groups
    end

    private

    def set_examination
      @examination = Services::Osym::Examination.new(
        Rails.application.credentials.osym[:username],
        Rails.application.credentials.osym[:password]
      )
    end
  end
end
