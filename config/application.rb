# frozen_string_literal: true

require_relative 'boot'

require 'rails'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'

require 'action_controller/railtie'
require 'action_view/railtie'

require 'rails/test_unit/railtie'

Bundler.require(*Rails.groups)

module Xokul
  class Application < Rails::Application
    config.load_defaults 5.2

    config.api_only = true

    reloader.to_prepare do
      require_dependency Rails.root.join('lib', 'support.rb')
    end
  end
end
