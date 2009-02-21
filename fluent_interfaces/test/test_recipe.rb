require "test/unit"
require File.dirname(__FILE__) + '/../recipe'
require File.dirname(__FILE__) + '/../ingredient'
require File.dirname(__FILE__) + '/../numeric_as_units'
require File.dirname(__FILE__) + '/../ingredient_factory'

class TestRecipe < Test::Unit::TestCase

  def test_of
    i = 1.gram.of Flour
    assert i.kind_of? Ingredient
    assert i.name == "Flour"
    assert i.quantity == 1
  end

  def test_add_ingredient
    recipe = Recipe.new
    expected = 2.lbs.of Flour
    recipe.add expected
    assert recipe.ingredients.size == 1
    assert recipe.ingredients[0] == expected
  end

  def test_ingredient_add_when_using_string
    recipe = Recipe.new
    expected = 2.lbs.of "Flour"    
    recipe.add expected
    assert recipe.ingredients.size == 1
    assert recipe.ingredients[0] == expected
  end

  def test_full_recipe
    recipe = Recipe.new
    expected = [] << 2.lbs.of("Flour") << 1.gram.of("Nutmeg")
    expected.each {|i| recipe.add i}
    assert_equal 2, recipe.ingredients.size
    assert_equal("Flour", recipe.ingredients[0].name)
    assert_equal(2 * 453.59237, recipe.ingredients[0].quantity)
    assert_equal("Nutmeg", recipe.ingredients[1].name)
    assert_equal(1, recipe.ingredients[1].quantity)
  end

  def test_nutrition_profile_for_recipe
    recipe = Recipe.new
    expected = [] << 2.lbs.of(Flour) << 1.gram.of(Nutmeg)
    expected.each {|i| recipe.add i}
    protein = 11.5 + 5.84
    lipid = 1.45 + 36.31
    sugar = 1.12 + 28.49
    calcium = 20 + 184
    sodium = 2 + 16
    expected_profile = recipe.nutrition_profile
    assert_equal expected_profile.protein, protein
    assert_equal expected_profile.lipid, lipid
    assert_equal expected_profile.sugars, sugar
    assert_equal expected_profile.calcium, calcium
    assert_equal expected_profile.sodium, sodium
  end
  
  def test_old_syntax
    recipe = Recipe.new "Milky Gravy"
    recipe.add 1.lb.of Flour
    recipe.add 200.grams.of Milk
    recipe.add 1.gram.of Nutmeg
    assert_equal 3, recipe.ingredients.size    
  end
  

  def test_consists_of
    recipe = Recipe.new "Milky Gravy" 
    recipe.consists_of {
      add 1.lb.of Flour
      add 200.grams.of Milk
      add 1.gram.of Nutmeg
    }
    assert_equal 3, recipe.ingredients.size
  end
end