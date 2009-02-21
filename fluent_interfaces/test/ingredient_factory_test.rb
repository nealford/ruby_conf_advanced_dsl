require "test/unit"
require File.dirname(__FILE__) + '/../ingredient'
require File.dirname(__FILE__) + '/../ingredient_factory'
                                                 
class TestIngredientFactory < Test::Unit::TestCase
  def test_ingredient_factory
    i = Flour
    assert i.kind_of? Ingredient
    assert i.name == "Flour"
  end
end