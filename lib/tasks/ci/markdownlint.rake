# frozen_string_literal: true

namespace :ci do
  desc 'Check the documentation format via markdownlint'
  task :markdownlint do
    sh 'yarn run markdownlint doc README.md', verbose: false
  end
end
