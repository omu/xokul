# frozen_string_literal: true

module OsymResource
  extend ActiveSupport::Concern

  def action_serializer
    "Osym::#{controller_name.camelize}::#{action_name.camelize}Serializer".constantize
  end

  def api_version
    Services::Osym::VERSION
  end
end
