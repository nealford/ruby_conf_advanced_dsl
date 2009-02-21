require "test/unit" 
require File.dirname(__FILE__) + '/../ingredient'
require File.dirname(__FILE__) + '/../smart_ingredient_builder'

class TestSmartIngredients < Test::Unit::TestCase
  include SmartIngredientBuilder
  
  def test_correct_spelling
    i = Flour
    assert i.kind_of? Ingredient
    assert_equal(i.name, "Flour")
  end
  
  def test_misspelling
    i = Flower
    assert i.kind_of? Ingredient
    assert_equal(i.name, "Flour")    
  end
  
  def test_missing_ingredient
    assert_raise(RuntimeError) {  
      i = BakingSoda
    }    
  end     
end