# frozen_string_literal: true

module Tenant
  def self.credentials
    Rails.application.credentials
  end
end
