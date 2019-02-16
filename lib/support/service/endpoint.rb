# frozen_string_literal: true

module Service
  class Endpoint
    class Meta
      ACCESSORS = %i[name synopsis version].freeze

      attr_accessor(*ACCESSORS)
    end

    module DSL
      Meta::ACCESSORS.each do |accessor|
        define_method(accessor) { |arg| meta.send("#{accessor}=", arg) }
      end
    end

    extend DSL

    def self.meta
      @meta ||= Meta.new
      yield @meta if block_given?
      @meta
    end

    private_constant :Meta, :DSL
  end
end
