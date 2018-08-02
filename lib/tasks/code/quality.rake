# frozen_string_literal: true

namespace :code do
  namespace :quality do
    desc 'Runs Ruby specific quality tests'
    task :ruby do
      sh 'bundle exec rubocop -f fu -D'
    end

    desc 'Runs Rails specific quality tests'
    task :rails do
      sh 'bundle exec rubocop -f fu -R -D'
    end

    desc 'Runs all quality tests'
    task all: %w[ruby rails]
  end
end
