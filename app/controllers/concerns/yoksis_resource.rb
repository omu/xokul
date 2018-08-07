# frozen_string_literal: true

module YoksisResource
  extend ActiveSupport::Concern

  def api_version
    Services::Yoksis::VERSION
  end
end
