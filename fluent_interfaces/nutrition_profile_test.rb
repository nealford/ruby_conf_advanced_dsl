require "test/unit"

require "nutrition_profile"

class TestNutritionProfile < Test::Unit::TestCase
  def test_create_with_hash
    actual = NutritionProfile.create_from_hash "name", "protein"=>11.5, "lipid"=>1.45,  "sugars"=>1.12,  "calcium"=>20, "sodium"=>0
    assert actual.kind_of? NutritionProfile
    assert_equal "name", actual.name
    assert_equal 11.5, actual.protein
    assert_equal 1.45, actual.lipid 
    assert_equal 1.12, actual.sugars
    assert_equal 20, actual.calcium
    assert_equal 0, actual.sodium
    
  end
end

