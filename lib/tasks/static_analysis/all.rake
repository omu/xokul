# frozen_string_literal: true

namespace :static_analysis do
  desc 'Run all static analysis tasks'
  task all: %w[bundle_audit brakeman executables markdownlint rubocop secrets]
end
