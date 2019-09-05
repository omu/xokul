# frozen_string_literal: true

require 'bundler/audit/task'

namespace :ci do
  Bundler::Audit::Task.new
end
