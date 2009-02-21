require 'rubygems'
require "test/unit"
require 'sticky_recipe'

class TestStickyRecipe < Test::Unit::TestCase
  def test_simple_ingredients
     actual = Ingredient.process_line(<<DSL)
2 tablespoons vanilla
DSL
    expected = Ingredient.new 2, "tablespoons", "vanilla"
    assert_equal expected, actual
  end

  def test_multiple_ingredients
    lines = (<<DSL)
2 tablespoons vanilla
1 pound sifted flour
DSL
    actual = []
    lines.each_with_index { |l, i| 
      actual[i] = Ingredient.process_line l
    }
    [Ingredient.new(2, "tablespoons", "vanilla"), Ingredient.new(1, "pound", "sifted flour")].each_with_index do |e, j|
      assert_equal e, actual[j]
    end
    
    
  end
  

    
end
