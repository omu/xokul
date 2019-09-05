# frozen_string_literal: true

namespace :ci do
  desc 'Check gitimport for any updates.'
  task :gitimport do
    if find_executable('git-import')
      sh 'git-import'
      sh 'git diff --quiet --exit-code **/*' do |ok, _|
        abort "Some of your files are outdated. You need to get updates via git-import." unless ok
      end
    else
      warn 'git-import not installed.'
    end
  end
end
