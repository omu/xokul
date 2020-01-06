# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby File.read(File.expand_path('.ruby-version', __dir__))

gem 'active_model_serializers', '~> 0.10.10'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pagy', '~> 3.7.1'
gem 'pg', '~> 1.2.1'
gem 'puma', '~> 4.3'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'rollbar'
gem 'savon'
gem 'webpacker'

# This is a workaround until the issue will be closed. See: https://github.com/liufengyun/hashdiff/issues/45
gem 'hashdiff', ['>= 1.0.0.beta1', '< 2.0.0']

group :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'rubocop'
  gem 'rubocop-minitest'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.3'
  gem 'web-console', '>= 3.3.0'
end
