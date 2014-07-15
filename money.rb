require_relative 'sum'

class Money
  attr_reader :currency, :amount

  def initialize amount, currency
    @amount = amount
    @currency = currency
  end

  def == money
    @amount == money.amount &&
      currency == money.currency
  end

  def times multiplier
    Money.new @amount * multiplier, currency
  end

  def plus addend
    Sum.new self, addend
  end

  def reduce bank: nil, to: nil
    rate = bank.rate @currency, to
    Money.new @amount / rate, to
  end

  def self.dollar amount
    Money.new amount, 'USD'
  end

  def self.franc amount
    Money.new amount, 'CHF'
  end

  def inspect
    "#{amount.to_s} #{currency}"
  end
end
