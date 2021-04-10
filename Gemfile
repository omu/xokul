# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.expand_path('.ruby-version', __dir__))

gem 'active_model_serializers', '~> 0.10.10'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pagy', '~> 3.8.1'
gem 'pg', '~> 1.2.3'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.3'
gem 'rollbar'
gem 'savon'

# This is a workaround until the issue will be closed. See: https://github.com/liufengyun/hashdiff/issues/45
gem 'hashdiff', ['>= 1.0.0.beta1', '< 2.0.0']

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails', '>= 2.7.5'
  gem 'pry-rails'
  gem 'rubocop', '>= 0.86.0'
  gem 'rubocop-minitest', '>= 0.9.0'
  gem 'rubocop-performance', '>= 1.6.1'
  gem 'rubocop-rails', '>= 2.6.0'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'web-console', '>= 4.0.1'
end
