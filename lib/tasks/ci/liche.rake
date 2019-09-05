# frozen_string_literal: true

namespace :ci do
  desc 'Check broken links in documents via liche'
  task :liche do
    sh 'liche -d . -r .github doc plugins README.md', verbose: false
  end
end
