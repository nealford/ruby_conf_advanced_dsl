require File.dirname(__FILE__) + '/nutrition_profile'
require File.dirname(__FILE__) + '/nutrition_profile_database'

class Recipe
  attr_reader :ingredients
  attr_accessor :name

  def initialize(name="")
    @ingredients = []
    @name = name
  end

  def add ingredient
    @ingredients << ingredient
    return self
  end

  def nutrition_profile
    profile = NutritionProfile.new @name
    ingredients.each { |i|
      foo = NutritionProfileDatabase.get_profile_for(i)
      add_to profile, NutritionProfileDatabase.get_profile_for(i)
    }
    profile
  end

  def consists_of &block
    instance_eval &block
  end

  private
  def add_to profile, ingredient_profile
    profile.protein += ingredient_profile.protein
    profile.lipid += ingredient_profile.lipid
    profile.sugars +=ingredient_profile.sugars
    profile.calcium += ingredient_profile.calcium
    profile.sodium += ingredient_profile.sodium
  end
end
