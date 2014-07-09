require_relative 'dollar'

describe Dollar do
  it 'multiplied by number' do
    five = Dollar.new 5
    expect( five.times 2 ).to eq Dollar.new 10
    expect( five.times 3 ).to eq Dollar.new 15
  end

  it 'equals by amount' do
    expect( Dollar.new 5 ).to eq Dollar.new 5
    expect( Dollar.new 5 ).not_to eq Dollar.new 6
    expect( Dollar.new 5 ).not_to eq Franc.new 5
  end
end
