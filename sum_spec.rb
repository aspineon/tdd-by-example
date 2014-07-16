require_relative 'sum'

describe Sum do
  it 'summed with money' do
    fiveBucks = Money.dollar 5
    tenFrancs = Money.franc 10
    bank = Bank.new
    bank.addRate 'CHF', 'USD', 2
    sum = Sum.new( fiveBucks, tenFrancs ).plus fiveBucks
    result = bank.reduce expression: sum, currency: 'USD'
    expect( result ).to eq Money.dollar 15
  end

  it 'multiplied by number' do
    fiveBucks = Money.dollar 5
    tenFrancs = Money.franc 10
    bank = Bank.new
    bank.addRate 'CHF', 'USD', 2
    sum = Sum.new( fiveBucks, tenFrancs).times 2
    result = bank.reduce expression: sum, currency: 'USD'
    expect( result ).to eq Money.dollar 20
  end
end
