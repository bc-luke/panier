require 'spec_helper'

include Panier::Domain

describe Panier::Application::SalesTaxService do
  shared_examples 'produces CSV output' do
    it 'should produce a CSV formatted receipt' do
      service = Panier::Application::SalesTaxService.new

      actual = service.evaluate_input(input)

      expect(actual).to eq(expected)
    end
  end

  describe '#evaluate_input' do
    context 'given the data from input 1' do
      include_examples 'produces CSV output' do
        let(:input) do
          'Quantity, Product, Price
1, book, 12.49
1, music CD, 14.99
1, chocolate bar, 0.85
'
        end

        let(:expected) do
          '1, book, 12.49
1, music CD, 16.49
1, chocolate bar, 0.85

Sales Taxes: 1.50
Total: 29.83
'
        end
      end
    end

    context 'given the data from input 2' do
      include_examples 'produces CSV output' do
        let(:input) do
          'Quantity, Product, Price
1, imported box of chocolates, 10.00
1, imported bottle of perfume, 47.50
'
        end

        let(:expected) do
          '1, imported box of chocolates, 10.50
1, imported bottle of perfume, 54.65

Sales Taxes: 7.65
Total: 65.15
'
        end
      end
    end

    context 'given the data from input 3' do
      include_examples 'produces CSV output' do
        let(:input) do
          'Quantity, Product, Price
1, imported bottle of perfume, 27.99
1, bottle of perfume, 18.99
1, packet of headache pills, 9.75
1, box of imported chocolates, 11.25
'
        end

        let(:expected) do
          '1, imported bottle of perfume, 32.19
1, bottle of perfume, 20.89
1, packet of headache pills, 9.75
1, box of imported chocolates, 11.85

Sales Taxes: 6.70
Total: 74.68
'
        end
      end
    end
  end
end
