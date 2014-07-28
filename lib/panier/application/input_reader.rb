require 'csv'

include Panier::Domain

module Panier
  module Application
    ##
    # The InputReader is responsible for parsing raw input data.
    #
    class InputReader
      CELLS_PER_LINE = 3
      HEADER = /quantity.*?,.*?product.*?,.*?price/i

      def initialize(product_service = nil)
        @product_service = product_service ||
            Panier::Domain::ProductService.new
      end

      def parse_input(input)
        line_items = input.lines.reject(&:blank?).map do |line|
          parse_line(line)
        end
        line_items.reject(&:nil?)
      end

      def parse_line(line)
        return nil if line.match(HEADER)
        parsed = CSV.parse_line(line)
        unless parsed.count == CELLS_PER_LINE
          fail ArgumentError, 'invalid input'
        end
        quantity = Integer(parsed[0])
        name = parsed[1].strip
        price = Money.new(Float(parsed[2]) * 100)

        product = @product_service.find_by_name_and_price(name, price)
        product.present? ? LineItem.new(product, quantity) : nil
      end
    end
  end
end
