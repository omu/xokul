# frozen_string_literal: true

module ActionsResource
  extend ActiveSupport::Concern

  DOCUMENTATION_URL = 'https://developer.omu.edu.tr'
  private_constant :DOCUMENTATION_URL

  def index
    render json: {
      documentation_url: "#{DOCUMENTATION_URL}/#{controller_name}/##{api_version}"
    }
  end
end
