# frozen_string_literal: true

module Service
  class Endpoint
    class Meta
      ATTRIBUTES = %i[name synopsis version].freeze

      attr_accessor(*ATTRIBUTES)

      def to_h
        Hash[
          ATTRIBUTES.zip(
            ATTRIBUTES.map { |attribute| send(attribute) }
          )
        ]
      end
    end

    module DSL
      Meta::ATTRIBUTES.each do |attribute|
        define_method(attribute) { |arg| meta.send("#{attribute}=", arg) }
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
