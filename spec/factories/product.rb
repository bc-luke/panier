require 'money'

FactoryGirl.define do
  factory :product, class: Panier::Domain::Product do

    name Faker::Commerce.product_name
    price Money.new(200)
    tax_classes []

    initialize_with { new(name, price, tax_classes) }

    factory :taxable_product do
      tax_classes { [build(:tax_class)] }
    end
  end
end
