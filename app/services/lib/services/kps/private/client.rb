# frozen_string_literal: true

module Services
  module Kps
    module Private
      class Client
        def initialize(**params)
          @endpoint  = params[:endpoint]
          @reference = params[:reference]
          @sts = Sts.new(
            username:  params[:username],
            password:  params[:password],
            endpoint:  @endpoint,
            reference: @reference
          )
        end

        def call(action, **arguments)
          Wst.new(
            endpoint:  @endpoint,
            reference: @reference,
            token:     @sts.token_request
          ).request(action, arguments)
        end
      end
    end
  end
end
