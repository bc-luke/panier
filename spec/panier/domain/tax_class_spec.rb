require 'spec_helper'

include Panier

describe Domain::TaxClass do
  describe '#initialize' do
    it 'assigns its arguments to attributes' do
      name = 'Basic sales tax'
      rate = 0.1
      tax_class = Domain::TaxClass.new(name, rate)
      expect(tax_class.name).to eq(name)
      expect(tax_class.rate).to eq(rate)
    end

    it 'rejects negative tax rates' do
      name = 'Backwards sales tax'
      rate = -0.1
      expect { Domain::TaxClass.new(name, rate) }.to raise_error
    end
  end
end
