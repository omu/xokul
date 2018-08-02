# frozen_string_literal: true

namespace :code do
  namespace :security do
    desc 'Checks vulnerabilities using brakeman'
    task :brakeman do
      sh 'bundle exec brakeman -q'
    end

    desc 'Checks dependencies and vulnerabilities using audit'
    task :audit do
      sh 'bundle audit check --update'
    end

    desc 'Runs all security tasks'
    task all: %w[brakeman audit]
  end
end
