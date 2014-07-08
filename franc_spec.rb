require_relative 'franc'

describe Franc do
  it 'multiplied by number' do
    five = Franc.new 5
    expect( five.times 2 ).to eq Franc.new 10
    expect( five.times 3 ).to eq Franc.new 15
  end
end
