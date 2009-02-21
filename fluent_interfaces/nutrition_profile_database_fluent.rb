require "nutrition_profile"
require "nutrition_profile_definition"

class NutritionProfileDatabase
  attr_accessor :profile
  
  def initialize
    build_database
  end
  
  def build_database
    @profile = Hash.new
    f = File.new("ingredients.dsl")
    f.each_line do |f|
      npd = NutritionProfileDefinition.new
      f.each_line do |l| 
        np = npd.process_definition l 
        @profile[np.name] = np
      end
    end
  end
  
  def get_profile_for ingredient
    @profile[ingredient]
  end

end
