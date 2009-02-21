require "test/unit"
require File.dirname(__FILE__) + '/../nutrition_profile_database'
require File.dirname(__FILE__) + '/../ingredient'

class TestNutritionProfileDatabase < Test::Unit::TestCase
  def test_database_returns_correct_value
    i = Ingredient.new("flour")
    np = NutritionProfileDatabase.get_profile_for i
    assert_equal np.kind_of?(NutritionProfile), true
    assert_equal 11.50, np.protein
    assert_equal 1.45, np.lipid
    assert_equal 1.12, np.sugars
    assert_equal 20, np.calcium
    assert_equal 2, np.sodium
  end
end