require "test/unit" 
require File.dirname(__FILE__) + '/../ingredient'
require File.dirname(__FILE__) + '/../ingredient_builder'

class TestIngredients < Test::Unit::TestCase
  include IngredientBuilder
  
  def test_ingredient_factory
    i = Flour
    assert i.kind_of? Ingredient
    assert_equal(i.name, "Flour")
  end
    
  def test_conversion
    i = Ingredient.new "foo"
    i.conversion_constant = 9.5
    i.quantity = 2
    assert i.weight == 9.5 * 2 
  end
end