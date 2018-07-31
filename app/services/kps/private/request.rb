# frozen_string_literal: true

module Services
  module Kps
    module Private
      class Request
        def initialize(**params)
          @url     = params[:endpoint]
          @action  = params[:action]
          @body    = params[:body]

          sts = Sts.new(
            username:  params[:username],
            password:  params[:password],
            endpoint:  params[:sts_endpoint],
            reference: params[:reference]
          )
          @xml_doc = Nokogiri::XML(sts.token)
        end
      end
    end
  end
end
