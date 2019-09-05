# frozen_string_literal: true

require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_text/engine'
require 'action_view/railtie'

require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module Xokul
  class Application < Rails::Application
    config.load_defaults 6.0

    config.api_only = true
  end
end
