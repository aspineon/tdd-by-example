require_relative 'money'
require_relative 'bank'

describe Money do
  it 'multiplied by number' do
    five = Money.franc 5
    expect( five.times 2 ).to eq Money.franc 10
    expect( five.times 3 ).to eq Money.franc 15
  end

  it 'sum money' do
    five = Money.dollar 5
    sum = five.plus five
    bank = Bank.new
    reduced = bank.reduce expression: sum, currency: 'USD'
    expect( reduced ).to eq Money.dollar 10
  end

  it 'plus gives sum' do
    five = Money.dollar 5
    sum = five.plus five
    expect( sum.augend ).to eq five
    expect( sum.addend ).to eq five
  end

  it 'equals by amount' do
    expect( Money.franc 5 ).to eq Money.franc 5
    expect( Money.franc 5 ).not_to eq Money.franc 6
    expect( Money.dollar 5 ).not_to eq Money.franc 5
  end

  it 'has currency' do
    expect( Money.franc( 1 ).currency ).to eq 'CHF'
  end
end
