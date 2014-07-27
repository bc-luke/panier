# Encoding: utf-8

module Panier
  module Domain
    ##
    # A product is a purchasable item with a price and one or more tax classes
    # that allow taxes to be calculated accurately.
    #
    class Product
      attr_accessor :name, :tax_classes
      attr_reader :price

      ##
      # Initializes the product using the given name, price and optional tax
      # classes.
      #
      # @param name [String]
      # @param price [Money]
      # @param tax_classes [Array]
      #
      def initialize(name, price, tax_classes = [])
        @name = name
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
