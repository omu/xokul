# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from Client::HTTPError,              with: :services_error
  rescue_from Client::SOAPError,              with: :services_error
  rescue_from Client::TCPError,               with: :services_error
  rescue_from Client::UnknownOperationError,  with: :services_error
  rescue_from Services::InvalidResponseError, with: :services_error
  rescue_from Services::NoContentError,       with: :services_error

  rescue_from ActionController::ParameterMissing do |exception|
    render json: {
      status: 400, error: "Missing parameters: #{exception.param}"
    }, status: :bad_request
  end

  def not_found
    render json: { status: 404, error: 'Not found.' }, status: :not_found
  end

  def services_error(exception)
    logger.error exception

    render json: { status: exception.code, error: exception },
           status: exception.code
  end

  def render_as_json(data)
    serializer_type = data.is_a?(Array) ? :each_serializer : :serializer
    render json: data, "#{serializer_type}": action_serializer
  end
end
