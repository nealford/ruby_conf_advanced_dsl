require 'nutrition_profile'

class NutritionProfileDefinition
  class << self
    def const_missing(sym)
      sym.to_s.downcase
    end
  end
  
  def polish_text(definition_line)        
    polished_text = definition_line.clone
    polished_text.gsub!(/=/, '=>')
    polished_text.sub!(/and /, '')
    polished_text.sub!(/has /, ',')
    polished_text
  end

  def process_definition(definition)
    instance_eval polish_text(definition)
  end

  def ingredient(name, ingredients)
    NutritionProfile.create_from_hash name, ingredients
  end    
   
end