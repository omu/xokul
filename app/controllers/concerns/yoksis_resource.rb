# frozen_string_literal: true

module YoksisResource
  extend ActiveSupport::Concern

  def action_serializer
    "Yoksis::#{controller_name.camelize}::#{action_name.camelize}Serializer".constantize
  end

  def api_version
    Services::Yoksis::VERSION
  end
end
