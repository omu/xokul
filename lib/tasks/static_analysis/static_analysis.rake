# frozen_string_literal: true

unless Rails.env.production?
  require_relative 'lib/audit'
  require_relative 'lib/brakeman'
  require_relative 'lib/markdownlint'
  require_relative 'lib/rubocop'

  namespace :static_analysis do
    desc 'Run all static analysis checks'
    task all: %i[audit brakeman markdownlint rubocop]
  end
end
