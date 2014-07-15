require 'ostruct'

class Bank
  def initialize
    @rates = {}
  end

  def reduce expression: nil, currency: nil
    expression.reduce bank: self, to: currency
  end

  def addRate from, to, rate
    @rates[OpenStruct.new( :from => from, :to => to )] = rate
  end

  def rate from, to
    return 1 if from == to
    @rates[OpenStruct.new( :from => from, :to => to )]
  end
end
