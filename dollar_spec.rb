require_relative 'dollar'

describe Dollar do
  it 'multiplied by number' do
    five = Dollar.new 5
    product = five.times 2
    expect( product.amount ).to eq 10
    product = five.times 3
    expect( product.amount ).to eq 15
  end

  it 'equals by amount' do
    expect( Dollar.new 5 ).to eq Dollar.new 5
    expect( Dollar.new 5 ).not_to eq Dollar.new 6
  end
end
