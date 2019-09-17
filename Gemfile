# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.expand_path('.ruby-version', __dir__))

gem 'active_model_serializers', '0.10.9'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pagy', '~> 0.6.0'
gem 'pg', '~> 0.18.2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'rollbar'
gem 'savon'

# This is a workaround until the issue will be closed. See: https://github.com/liufengyun/hashdiff/issues/45
gem 'hashdiff', ['>= 1.0.0.beta1', '< 2.0.0']

group :beta, :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'reek'
  gem 'rubocop'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'vcr'
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end
