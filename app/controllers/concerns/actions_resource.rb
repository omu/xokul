# frozen_string_literal: true

module ActionsResource
  extend ActiveSupport::Concern

  DOCUMENTATION_URL = 'https://developer.omu.edu.tr'
  private_constant :DOCUMENTATION_URL

  def index
    render json: {
      documentation_url: "#{DOCUMENTATION_URL}/#{controller_name}/##{Services::VERSION}"
    }
  end

  def action_serializer
    service = File.split(controller_path).first.capitalize
    "#{service}::#{controller_name.camelize}::#{action_name.camelize}Serializer".constantize
  end
end
