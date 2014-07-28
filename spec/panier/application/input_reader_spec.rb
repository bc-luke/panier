require 'spec_helper'

describe Panier::Application::InputReader do
  describe '#create_line_item' do
    it 'creates a line item from input' do

      service = instance_double(Panier::Domain::ProductService)
      product = build :product

      expect(service).to receive(:find_by_name_and_price)
                         .with(product.name, product.price) { product }

      reader = Panier::Application::InputReader.new(service)
      line_item = reader.parse_line("1, #{product.name}, #{product.price}")

      expect(line_item.quantity).to eq(1)
      expect(line_item.description).to eq(product.name)
      expect(line_item.unit_amount).to eq(product.price)
    end
  end
end
