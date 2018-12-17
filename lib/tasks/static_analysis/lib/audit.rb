# frozen_string_literal: true

require 'bundler/audit/cli'

namespace :static_analysis do
  desc 'Analyze potential vulnerable gems and insecure sources via Audit'
  task :audit do
    Bundler::Audit::CLI.start %w[check --update]
  end
end
