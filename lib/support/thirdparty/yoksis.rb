# frozen_string_literal: true

require_relative 'yoksis/graduate'
require_relative 'yoksis/meb'
require_relative 'yoksis/reference'
require_relative 'yoksis/resume'
require_relative 'yoksis/staff'
require_relative 'yoksis/unit'

module Thirdparty
  module Yoksis
    # This is an easy way to read a credential from Rails credentials.
    CREDENTIALS = Rails.application.credentials.yoksis

    # Set the default configurations for Reference class.
    Reference.configure do |config|
      config.endpoint = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'
    end

    # Set the default configurations for Staff class.
    Staff.configure do |config|
      config.endpoint = 'http://servisler.yok.gov.tr/ws/UniversiteAkademikPersonelv1?WSDL'
      config.client_id = CREDENTIALS[:client_id]
      config.client_secret = CREDENTIALS[:client_secret]
    end
  end
end
