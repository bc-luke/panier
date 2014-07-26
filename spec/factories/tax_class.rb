FactoryGirl.define do
  factory :tax_class, class: Panier::Domain::TaxClass do
    name 'Basic sales tax'
    rate 0.1

    initialize_with { new(name, rate) }
  end
end
