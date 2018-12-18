# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'active_model_serializers'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '~> 0.18.2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.1', '>= 5.2.1.1'
gem 'savon'

group :beta, :development, :test do
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry-rails'
  gem 'reek'
  gem 'rubocop'
  gem 'webmock'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
end
