# frozen_string_literal: true

module Services
  module Kps
    module Private
      module V1
        class Kutuk < Services::Kps::Private::Service
          ENDPOINT_REFERENCE = 'https://kpsv2.nvi.gov.tr/Services/RoutingService.svc'
          STS_URL = 'https://kimlikdogrulama.nvi.gov.tr/Services/Issuer.svc/IWSTrust13'

          def initialize(_username, _password)
            super
            @sts_url = STS_URL
            @endpoint_reference = ENDPOINT_REFERENCE
          end
        end
      end
    end
  end
end
