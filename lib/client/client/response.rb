# frozen_string_literal: true

class Response
  delegate :header, :body, to: :@soap_response

  def initialize(soap_response)
    @soap_response = soap_response
  end

  def dig(*args)
    dug = body.dig(*args)
    return dug unless block_given?
    yield dug
  end
end
