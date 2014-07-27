require 'spec_helper'

include Panier

describe Domain::Product do

  describe '#initialize' do
    it 'assigns its arguments to attributes' do
      name = Faker::Commerce.product_name
      price = Money.new(200)
      tax_classes = [build(:tax_class)]
      product = build :taxable_product,
                      name: name, price: price, tax_classes: tax_classes

      expect(product.name).to eq(name)
      expect(product.price).to eq(price)
      expect(product.tax_classes).to eq(tax_classes)
    end
  end

  describe '#price=' do
    it 'rejects negative prices' do
      product = build :product

      expect { product.price = Money.new(-1) }.to raise_exception
    end
  end
end
