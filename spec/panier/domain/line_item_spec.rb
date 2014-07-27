require 'spec_helper'
require 'money'

include Panier

describe Domain::LineItem do
  describe '#initialize' do
    it 'assigns its arguments to attributes' do
      product = build :product
      quantity = 5

      line_item = build :line_item, product: product, quantity: quantity

      expect(line_item.product).to eq(product)
      expect(line_item.quantity).to eq(quantity)
    end

    it 'rejects negative quantities' do
      product = build :product
      quantity = -5

      expect { Domain::LineItem.new(product, quantity) }.to raise_exception
    end
  end

  describe '#total_amount' do
    it 'calculates the total value of the line item' do
      line_item = build :taxable_line_item, quantity: 5
      expect(line_item.total_amount).to eq(Money.new(1000))
    end
  end

  describe '#total_tax' do
    it 'calculates the total amount of tax included in the line item' do
      line_item = build :taxable_line_item, quantity: 5
      expect(line_item.total_tax).to eq(Money.new(100))
    end
  end

  describe '#unit_tax' do
    describe 'tax rounding' do
      it 'rounds low values up to the nearest 5 cents' do
        line_item = build :taxable_line_item, price: Money.new(310)
        expect(line_item.unit_tax).to eq(Money.new(35))
      end

      it 'rounds median values up to the nearest 5 cents' do
        line_item = build :taxable_line_item, price: Money.new(125)
        expect(line_item.unit_tax).to eq(Money.new(15))
      end

      it 'rounds high values up to the nearest 5 cents' do
        line_item = build :taxable_line_item, price: Money.new(140)
        expect(line_item.unit_tax).to eq(Money.new(15))
      end

      it 'does not change values divisible by 5' do
        line_item = build :taxable_line_item, price: Money.new(150)
        expect(line_item.unit_tax).to eq(Money.new(15))
      end
    end
  end
end
