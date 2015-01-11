require_relative 'dollar'

describe Dollar do
  it 'multiplied by number' do
    five = Dollar.new 5
    product = five.times 2
    expect( product.amount ).to eq 10
    product = five.times 3
    expect( product.amount ).to eq 15
  end
end
