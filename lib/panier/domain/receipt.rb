# Encoding: utf-8

module Panier
  module Domain
    ##
    # A receipt is a value object describing a payment that has been made by a
    # shopper to a merchant in relation to an order.
    #
    class Receipt
      attr_reader :line_items

      ##
      # Initializes the receipt with the given line items.
      #
      # @param line_items [Array] The line items to be represented on the
      #   receipt.
      def initialize(line_items)
        @line_items = line_items
      end

      ##
      # Calculates the total value of the receipt by adding together the total
      # values of all line items.
      #
      # @return [Money] The total value of the receipt.
      def total_amount
        line_items.reduce(Money.zero) { |a, e| a + e.total_amount_inc_tax }
      end

      ##
      # Calculates the total tax present on the receipt by adding together the
      # total tax of all line items.
      #
      # @return [Money] The total tax present on the receipt.
      def total_tax
        line_items.reduce(Money.zero) { |a, e| a + e.total_tax }
      end
    end
  end
end
