# frozen_string_literal: true

class Response
  delegate :header, :body, to: :@soap_response

  attr_accessor :status_body

  def initialize(soap_response)
    @soap_response = soap_response
  end

  def successful?
    return @soap_response.successful? unless status_body&.is_a?(Array)
    return true if status_body.empty?
    digged = body.dig(*status_body)
    return false if digged.present? || /[Ee]rror|[Ff]ail|[Ha]ta/.match?(digged)
    true
  end
end
