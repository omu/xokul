# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ActionDispatch::ParamsParser::ParseError, with: :bad_request
  rescue_from ActionController::BadRequest,             with: :bad_request
  rescue_from Rack::Utils::ParameterTypeError,          with: :bad_request
  rescue_from ActionController::ParameterMissing,       with: :bad_request
  rescue_from Rack::Utils::InvalidParameterError,       with: :bad_request
  rescue_from ActionController::RoutingError,           with: :not_found
  rescue_from AbstractController::ActionNotFound,       with: :not_found
  rescue_from ActionController::UnknownFormat,          with: :not_acceptable
  rescue_from ActionController::NotImplemented,         with: :not_implemented
  rescue_from Services::HTTPError,                      with: :services_error
  rescue_from Services::SOAPError,                      with: :services_error
  rescue_from Services::UnknownOperationError,          with: :services_error
  rescue_from Services::TCPError,                       with: :services_error

  def bad_request(exception)
    render_json message: exception, status: :bad_request
  end

  def not_acceptable(exception)
    render_json message: exception, status: :not_acceptable
  end

  def not_found(exception)
    render_json message: exception, status: :bad_request
  end

  def not_implemented(exception)
    render_json message: exception, status: :not_implemented
  end

  def services_error(exception)
    render_json message: exception, status: exception.code
  end

  private

  def render_json(**params)
    params[:documentation_url] = 'https://developer.omu.edu.tr'
    status = params.delete(:status)
    render json: params, status: status
  end
end
