# Encoding: utf-8

module Panier
  module Domain
    ##
    # A product is a purchasable item with a price and one or more tax classes
    # that allow taxes to be calculated accurately.
    #
    class Product
      attr_reader :price
      attr_accessor :tax_classes

      ##
      # Initializes the product using the given price and optional tax classes.
      #
      # @param price [Money]
      # @param tax_classes [Array]
      #
      def initialize(price, tax_classes = [])
        self.price = price
        @tax_classes = tax_classes
      end

      def price=(price)
        fail ArgumentError, ':price must be non-negative' if price.negative?
        @price = price
      end
    end
  end
end
