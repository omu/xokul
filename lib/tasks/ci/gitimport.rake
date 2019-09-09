# frozen_string_literal: true

require 'mkmf'

namespace :ci do
  desc 'Check for any updates via gitimport.'
  task :gitimport do
    if find_executable('git-import')
      sh 'git-import'
      sh 'git diff --quiet --exit-code **/*' do |ok, _|
        abort 'Update your files fetched with gitimport.' unless ok
      end
    else
      warn 'git-import not installed.'
    end
  end
end
