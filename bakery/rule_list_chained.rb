class RuleListChained
   attr_reader :rule_list
   
   def initialize
     @rule_list = []
   end
   
   def add()
     discount = Discount.new 
     @rule_list << discount
     puts discount
     discount
   end
   
   def count
     @rule_list.size
   end
   
   def [](index)
     @rule_list[index]
   end
end     

