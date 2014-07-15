class Sum
 attr_reader :augend, :addend

 def initialize augend, addend
   @augend = augend
   @addend = addend
 end

 def reduce bank: nil, to: nil
   Money.new augend.amount + addend.amount, to
 end
end
