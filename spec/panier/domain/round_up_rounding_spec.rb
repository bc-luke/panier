require 'rspec'

include Panier

describe Domain::RoundUpRounding do

  it 'rounds low values up to the nearest increment' do
    strategy = Domain::RoundUpRounding.new
    expect(strategy.round(Money.new(11))).to eq(Money.new(15))
  end

  it 'rounds median values up to the nearest increment' do
    strategy = Domain::RoundUpRounding.new(4)
    expect(strategy.round(Money.new(2))).to eq(Money.new(4))
  end

  it 'rounds high values up to the nearest increment' do
    strategy = Domain::RoundUpRounding.new
    expect(strategy.round(Money.new(14))).to eq(Money.new(15))
  end

  it 'does not change values divisible by the increment' do
    strategy = Domain::RoundUpRounding.new
    expect(strategy.round(Money.new(15))).to eq(Money.new(15))
  end
end
