# frozen_string_literal: true

module Yoksis
  CLIENT_ID     = Rails.application.credentials.yoksis[:client_id]
  CLIENT_SECRET = Rails.application.credentials.yoksis[:client_secret]
end

namespace :scheduled do
  namespace :daily do
    require_relative 'daily/academicians'
  end
end
