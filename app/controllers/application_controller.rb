# frozen_string_literal: true

class ApplicationController < ActionController::API  
  rescue_from ActionController::ParameterMissing, with: :rails_error_renderer
  rescue_from Services::SOAPError, Services::HTTPError, with: :service_error_renderer
  
  DOCUMENTATION_URL = 'https://developer.omu.edu.tr'
  
  # Will be an instance of serializer in the future
  def rails_error_renderer(exception)
    render json: { message: exception, documentation_url: DOCUMENTATION_URL }
  end

  def service_error_renderer(exception)
    render json: exception, serializer: ErrorSerializer
  end
end
