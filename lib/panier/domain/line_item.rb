# Encoding: utf-8
require 'money'

module Panier
  module Domain
    ##
    # A line item is a value object representing a single line of an order or
    # receipt.
    #
    class LineItem
      ##
      # The fractional value to which tax rounding calculations are made.
      #
      TAX_ROUNDING_VALUE = 5

      attr_reader :product, :quantity, :unit_amount, :tax_classes, :description

      ##
      # Initializes the line such that it represents the given quantity of
      # products.
      #
      # @param product [Product] The product represented in the line item.
      # @param quantity [Integer] The number of products represented.
      def initialize(product, quantity)
        @product = product
        self.quantity = quantity
        @rounding_strategy = RoundUpRounding.new(TAX_ROUNDING_VALUE)
        @description = product.name
        @unit_amount = product.price
        @tax_classes = product.tax_classes.dup
      end

      ##
      # Calculates the total value of the line item.
      #
      def total_amount
        unit_amount * quantity
      end

      ##
      # Calculates the total tax included in the line item.
      #
      def total_tax
        unit_tax * quantity
      end

      ##
      # Calculates the total value of the line item including tax.
      #
      # @return [Money] The total value of the line item including tax.
      def total_amount_inc_tax
        unit_amount_inc_tax * quantity
      end

      ##
      # Calculates the value of a single unit including tax.
      #
      def unit_amount_inc_tax
        unit_amount + unit_tax
      end

      ##
      # Calculates the tax applicable to one unit of the line item.
      #
      def unit_tax
        tax = Money.new(0)
        tax_classes.each do |tax_class|
          class_tax = @rounding_strategy.round(tax_class.rate * unit_amount)
          tax += class_tax
        end
        tax
      end

      private

      def quantity=(quantity)
        unless quantity.is_a? Integer
          fail ArgumentError, ':quantity must be a whole number'
        end
        fail ArgumentError, ':quantity must be non-negative' if quantity < 0
        @quantity = quantity
      end
    end
  end
end
