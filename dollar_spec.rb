require_relative 'dollar'

describe Dollar do
  it 'multiplied by number' do
    five = Dollar.new 5
    five.times 2
    expect( five.amount ).to eq 10
  end
end
