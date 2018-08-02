# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
  rescue_from Services::HTTPError,             with: :services_error
  rescue_from Services::SOAPFault,             with: :services_error
  rescue_from Services::UnknownOperationError, with: :services_error
  rescue_from Services::TCPError,              with: :services_error

  def parameter_missing(exception)
    render_json message: exception, status: :bad_request
  end

  def services_error(exception)
    render_json message: exception, status: exception.code
  end

  private

  def render_json(**params)
    documentation_url = { documentation_url: 'https://developer.omu.edu.tr' }
    status = params.delete(:status)
    render json: params.merge(documentation_url), status: status
  end
end
