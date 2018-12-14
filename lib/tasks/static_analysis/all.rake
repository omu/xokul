# frozen_string_literal: true

namespace :static_analysis do
  desc 'Run all static analysis checks'
  task all: %i[audit brakeman rubocop]
end
