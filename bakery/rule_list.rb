class RuleList
   attr_reader :rule_list
   
   def initialize
     @rule_list = []
   end
   
   def add(discount) 
     @rule_list << discount
     self
   end
   
   def [](index)
     @rule_list[index]
   end
   
   def count
     @rule_list.size
   end
end

