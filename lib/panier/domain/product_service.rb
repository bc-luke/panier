require 'money'

module Panier
  module Domain
    ##
    # The product service provides a means of finding and retrieving products
    # from the product catalog.
    #
    # This is an in-memory implementation, useful for testing, which contains
    # only the products from the given input data. A real-world implementation
    # would be backed by a database or web service.
    #
    class ProductService
      def initialize
        @tax = TaxClass.new('Basic sales tax', 0.1)
        @duty = TaxClass.new('Import duty', 0.05)

        @products = product_data.map do |row|
          Product.new(*row)
        end
      end

      def product_data
        [['book', Money.new(1249)],
         ['music CD', Money.new(1499), [@tax]],
         ['chocolate bar', Money.new(85)],
         ['imported box of chocolates', Money.new(1000), [@duty]],
         ['imported bottle of perfume', Money.new(4750), [@tax, @duty]],
         ['imported bottle of perfume', Money.new(2799), [@tax, @duty]],
         ['bottle of perfume', Money.new(1899), [@tax]],
         ['packet of headache pills',   Money.new(975)],
         ['box of imported chocolates', Money.new(1125), [@duty]]]
      end

      ##
      # Finds a product matching the given name and price.
      #
      # @param [String] name
      # @param [Money] price
      def find_by_name_and_price(name, price)
        @products.find do |product|
          product.name == name && product.price == price
        end
      end
    end
  end
end
