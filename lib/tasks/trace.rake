# frozen_string_literal: true

desc 'Enable debug mode'
task debug: %i[environment verbose] do
  Rails.logger.level = Logger::DEBUG
end

desc 'Enable verbose mode'
task verbose: %i[environment] do
  Rails.logger = Logger.new(STDOUT)
end
