FactoryGirl.define do
  factory :line_item, class: Panier::Domain::LineItem do

    ignore do
      price Money.new(200)
    end

    product { build :product, price: price }
    quantity 1

    initialize_with { new(product, quantity) }

    factory :taxable_line_item do
      product { build :taxable_product, price: price }
    end
  end
end
