class Sum
 attr_reader :augend, :addend

 def initialize augend, addend
   @augend = augend
   @addend = addend
 end

 def reduce bank: nil, to: nil
   augend = bank.reduce expression: @augend, currency: to
   addend = bank.reduce expression: @addend, currency: to
   Money.new augend.amount + addend.amount, to
 end
end
