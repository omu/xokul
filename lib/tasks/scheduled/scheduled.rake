# frozen_string_literal: true

module Yoksis
  module_function

  def client_id
    Rails.application.credentials.yoksis[:client_id]
  end

  def client_secret
    Rails.application.credentials.yoksis[:client_secret]
  end
end

namespace :scheduled do
  namespace :daily do
    require_relative 'daily/academicians'
  end
end
