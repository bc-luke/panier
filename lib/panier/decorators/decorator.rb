# Encoding: utf-8

module Panier
  module Decorators
    ##
    # Defines basic behaviour common to decorators.
    #
    module Decorator
      attr_reader :decorated

      def initialize(decorated)
        @decorated = decorated
      end

      def method_missing(symbol, *args, &block)
        super unless @decorated.respond_to? symbol
        @decorated.send(symbol, *args, &block)
      end

      def respond_to_missing?(name, include_private = false)
        @decorated.respond_to?(name, include_private) || super
      end
    end
  end
end
