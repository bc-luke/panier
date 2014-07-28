require 'spec_helper'

include Panier

describe Domain::Receipt do
  let(:line_items) do
    [
      build(:taxable_line_item, product_price: Money.new(100)),
      build(:taxable_line_item, product_price: Money.new(200))
    ]
  end

  describe '#initialize' do
    it 'should initialize the line items' do
      receipt = Domain::Receipt.new(line_items)
      expect(receipt.line_items).to eq(line_items)
    end
  end

  describe '#total_amount' do
    it 'should calculate the total value of the receipt including tax' do
      receipt = Domain::Receipt.new(line_items)
      expect(receipt.total_amount).to eq(Money.new(330))
    end
  end

  describe '#total_tax' do
    it 'should calculate the total tax present on the receipt' do
      receipt = Domain::Receipt.new(line_items)
      expect(receipt.total_tax).to eq(Money.new(30))
    end
  end
end
