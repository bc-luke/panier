require 'spec_helper'

include Panier::Domain

describe Panier::Decorators::ReceiptDecorator do
  describe '#to_csv' do
    it 'should generate CSV containing details of the receipt' do
      line_items = [
        LineItem.new(Product.new('product 1', Money.new(1000), []), 1),
        LineItem.new(Product.new('product 2', Money.new(1500),
                                 [build(:tax_class)]), 1)
      ]
      receipt = Domain::Receipt.new(line_items)
      decorator = Panier::Decorators::ReceiptDecorator.new(receipt)

      expect(decorator.to_csv).to eq('1, product 1, 10.00
1, product 2, 16.50

Sales Taxes: 1.50
Total: 26.50
')
    end
  end
end
