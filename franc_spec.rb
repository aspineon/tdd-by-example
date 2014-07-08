require_relative 'franc'

describe Franc do
  it 'multiplied by number' do
    five = Franc.new 5
    expect( five.times 2 ).to eq Franc.new 10
    expect( five.times 3 ).to eq Franc.new 15
  end

  it 'equals by amount' do
    expect( Franc.new 5 ).to eq Franc.new 5
    expect( Franc.new 5 ).not_to eq Franc.new 6
  end
end
