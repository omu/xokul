# frozen_string_literal: true

module Service
  module Tenant
    def self.credentials
      Rails.application.credentials
    end
  end
end
