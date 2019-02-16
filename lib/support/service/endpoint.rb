# frozen_string_literal: true

module Service
  class Endpoint
    class Meta
      Error          = Class.new(StandardError)
      AttributeError = Class.new(Error)

      ACCESSORS = %i[name synopsis version].freeze

      attr_accessor(*ACCESSORS)

      def respond_to_missing?(name, include_private = false)
        super
      end

      def method_missing(name, *args)
        raise AttributeError, "invalid attribute `#{name}` for #{self}" unless ACCESSORS.include?(name)

        super
      end
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
