# Encoding: utf-8
include Panier::Domain

module Panier
  module Application
    ##
    # This is an application layer service responsible for handling the
    # use-case of taking a list of items and producing a receipt.
    #
    class SalesTaxService
      def initialize(input_reader = nil)
        @input_reader = input_reader || InputReader.new
      end

      ##
      # Accepts a list of products and produces a receipt.
      #
      # @param [String] input A list of products in CSV format.
      # @param [String] A receipt in CSV format.
      def evaluate_input(input)
        line_items = @input_reader.parse_input(input)
        receipt = Receipt.new(line_items)
        decorator = Panier::Decorators::ReceiptDecorator.new(receipt)
        decorator.to_csv
      end
    end
  end
end
