# frozen_string_literal: true

module SafeRequest
  extend ActiveSupport::Concern

  def safe_request(method, args: {})
    variables = self.class::METHOD_VARIABLES[method]
    response = client.request(variables[:operation], args: args)
    response.status_body = variables[:status_body]
    raise Client::InvalidResponseError unless response.successful?
    response.body.dig(*variables[:special_body])
  end
end
