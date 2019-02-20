# frozen_string_literal: true

module Services
  class Endpoint
    class Meta
      ATTRIBUTES = %i[name synopsis version].freeze

      attr_accessor(*ATTRIBUTES)

      delegate :to_json, to: :to_h

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
