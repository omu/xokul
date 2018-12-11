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
    serializer = "#{controller_name.camelize}::#{action_name.camelize}Serializer"

    service = File.split(controller_path).first.capitalize
    return "#{service}::#{serializer}".constantize unless service.eql?('.')

    serializer.constantize
  end
end
