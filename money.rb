class Money
  attr_reader :currency

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

  def plus added
    Money.new @amount + added.amount, currency
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

  protected
  attr_reader :amount
end