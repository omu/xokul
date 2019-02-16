module Service
  class Endpoint
    class Meta
      Error     = Class.new(StandardError)
      NameError = Class.new(Error)

      ACCESSORS = %i[name synopsis version]

      attr_accessor(*ACCESSORS)

      def method_missing(sym, *)
        raise NameError, "invalid attribute: #{sym}"
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
