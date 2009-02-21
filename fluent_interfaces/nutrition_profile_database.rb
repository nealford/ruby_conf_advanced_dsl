require File.dirname(__FILE__) + '/nutrition_profile'

class NutritionProfileDatabase
  class << self
    def get_profile_for ingredient
      case ingredient.name.downcase
      when "flour"
        return NutritionProfile.new(11.50, 1.45, 1.12, 20, 2)
      when "nutmeg"
        return NutritionProfile.new(5.84, 36.31, 28.49, 184, 16)
      when "milk"
        return NutritionProfile.new(3.22, 3.25, 5.26, 113, 40)
      end
   end
  end
end
