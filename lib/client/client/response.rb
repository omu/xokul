# frozen_string_literal: true

class Client
  class Response
    delegate :code, :headers, :body, to: :@http
    delegate :to_hash, to: :@soap_response

    def initialize(soap_response, result_path:)
      @soap_response = soap_response
      @result_path = result_path
      @http = soap_response.http
    end

    def result
      value = to_hash.symbolize_keys.dig(*[@result_path].flatten)
      return value if value.present?
      Rails.logger.error <<~MESSAGE
        ResultError (invalid response or result path)
        [HTTP] Code: #{code} Headers: #{headers} Body: #{body}
        [SOAP] Response: #{@soap_response}
      MESSAGE
      raise ResponseError
    end
  end

  private_constant :Response
end
