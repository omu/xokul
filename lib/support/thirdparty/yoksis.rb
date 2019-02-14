# frozen_string_literal: true

require_relative 'yoksis/graduate'
require_relative 'yoksis/meb'
require_relative 'yoksis/reference'
require_relative 'yoksis/resume'
require_relative 'yoksis/staff'
require_relative 'yoksis/unit'

module Thirdparty
  module Yoksis
    Reference.configure do |config|
      config.endpoint = 'https://servisler.yok.gov.tr/ws/Referanslarv1?WSDL'
    end
  end
end
