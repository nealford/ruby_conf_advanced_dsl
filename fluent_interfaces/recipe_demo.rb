require File.dirname(__FILE__) + '/recipe'
require File.dirname(__FILE__) + '/numeric_as_units'
require File.dirname(__FILE__) + '/ingredient_factory'

def puts_nutritional_information_for recipe
  puts "Nutritional information for recipe '#{recipe.name}':"
  puts recipe.nutrition_profile
end

recipe = Recipe.new "Spicy bread"
recipe.add 200.grams.of Flour
recipe.add 1.lb.of Nutmeg

puts_nutritional_information_for recipe


Recipe.new("Milky Gravy").consists_of {
  add 1.lb.of Flour
  add 200.grams.of Milk
  add 1.gram.of Nutmeg
}

puts_nutritional_information_for alternate_recipe
