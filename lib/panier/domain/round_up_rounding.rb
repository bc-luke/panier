require 'money'

module Panier
  module Domain
    ##
    # A money-rounding strategy that rounds fractional values up to the nearest
    # increment. For example, $0.21 would be rounded up to $0.25.
    #
    class RoundUpRounding
      ##
      # @param increment [Integer] The fractional value to which rounding
      #   calculations are made.
      #
      def initialize(increment = 5)
        self.increment = increment
      end

      ##
      # Rounds a monetary value up to the nearest increment.
      #
      # @param value [Money] The amount of tax to be rounded.
      #
      def round(value)
        unless value % @increment == Money.zero
          value += Money.new(@increment) - value % @increment
        end
        value
      end

      private

      def increment=(increment)
        fail ArgumentError ':increment must be non-negative' if increment < 0
        @increment = increment
      end
    end
  end
end
