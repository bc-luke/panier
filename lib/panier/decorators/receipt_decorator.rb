# Encoding: utf-8
require 'csv'

module Panier
  module Decorators
    ##
    # Decorates a receipt with presentation-specific methods.
    #
    class ReceiptDecorator
      include Decorator

      ##
      # Generates CSV string expressing the details of the receipt.
      #
      # @return [String] CSV expressing the details of the receipt.
      def to_csv
        ::CSV.generate do |csv|
          decorated.line_items.each do |item|
            csv << [item.quantity, " #{item.description}",
                    " #{item.total_amount_inc_tax}"]
          end
          csv << []
          csv << ["Sales Taxes: #{total_tax}"]
          csv << ["Total: #{total_amount}"]
        end
      end
    end
  end
end
