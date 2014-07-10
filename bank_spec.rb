require_relative 'bank'
require_relative 'money'

describe Bank do
  it 'reduce sum' do
    sum = Sum.new Money.dollar( 3 ), Money.dollar( 4 )
    bank = Bank.new
    result = bank.reduce expression: sum, currency: 'USD'
    expect( result ).to eq Money.dollar 7
  end

  it 'reduce money' do
    bank = Bank.new
    result = bank.reduce expression: Money.dollar( 1 ), currency: 'USD'
    expect( result ).to eq Money.dollar 1
  end
end
