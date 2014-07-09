require_relative 'dollar'

describe Dollar do
  it 'multiplied by number' do
    five = Money.dollar 5
    expect( five.times 2 ).to eq Money.dollar 10
    expect( five.times 3 ).to eq Money.dollar 15
  end

  it 'equals by amount' do
    expect( Money.dollar 5 ).to eq Money.dollar 5
    expect( Money.dollar 5 ).not_to eq Money.dollar 6
    expect( Money.dollar 5 ).not_to eq Money.franc 5
  end

  it 'has currency' do
    expect( Money.dollar( 1 ).currency ).to eq 'USD'
  end
end
