# frozen_string_literal: true

class Response
  delegate :header, :body, :successful?, to: :@soap_response

  def initialize(soap_response)
    @soap_response = soap_response
  end

  def error?(*path)
    return true unless successful?
    /[Ee]rror|[Ff]ail|[Ha]ta/.match?(body.dig(*path))
  end

  def safe_dig(*path)
    body.dig(*path) || {}
  end
end
