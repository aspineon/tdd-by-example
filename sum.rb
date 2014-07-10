class Sum
 attr_reader :augend, :addend

 def initialize augend, addend
   @augend = augend
   @addend = addend
 end

 def reduce currency
   Money.new augend.amount + addend.amount, currency
 end
end
