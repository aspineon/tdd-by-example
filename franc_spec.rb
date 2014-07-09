require_relative 'franc'

describe Franc do
  it 'multiplied by number' do
    five = Money.franc 5
    expect( five.times 2 ).to eq Money.franc 10
    expect( five.times 3 ).to eq Money.franc 15
  end

  it 'equals by amount' do
    expect( Money.franc 5 ).to eq Money.franc 5
    expect( Money.franc 5 ).not_to eq Money.franc 6
    expect( Franc.new 5, 'CHF' ).to eq Money.new 5, 'CHF'
  end

  it 'has currency' do
    expect( Money.franc( 1 ).currency ).to eq 'CHF'
  end
end
