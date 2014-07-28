FactoryGirl.define do
  factory :receipt, class: Panier::Domain::Receipt do
    line_items { [build(:line_item)] }

    initialize_with { new(line_items) }

    factory :multi_item_receipt do

      ignore do
        item_count 5
        product_price Money.new(100)
      end

      line_items do
        Array.new(item_count) do
          build(:line_item, product_price: product_price)
        end
      end
    end
  end
end
