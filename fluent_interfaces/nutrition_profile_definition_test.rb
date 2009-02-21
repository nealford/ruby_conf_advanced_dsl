require "test/unit"

require "nutrition_profile_definition"

class TestNutritionProfileDefinition < Test::Unit::TestCase
  def test_definition_line
    script = 'ingredient "flour" has Protein=11.5, Lipid=1.45, Sugars=1.12, Calcium=20, Sodium=0'
    actual = NutritionProfileDefinition.new.process_definition script
    assert actual.kind_of? NutritionProfile
    assert_equal "flour", actual.name
    assert_equal 11.5, actual.protein
    assert_equal 1.45, actual.lipid 
    assert_equal 1.12, actual.sugars
    assert_equal 20, actual.calcium
    assert_equal 0, actual.sodium
  end
  
  def test_polish_text
    test_text = "ingredient \"flour\" has Protein=11.5, Lipid=1.45, Sugars=1.12, Calcium=20, and Sodium=0"
    expected = 'ingredient "flour" ,Protein=>11.5, Lipid=>1.45, Sugars=>1.12, Calcium=>20, Sodium=>0'
    assert_equal expected, NutritionProfileDefinition.new.polish_text(test_text)
  end
  
  def test_create_ingredient
    actual = NutritionProfileDefinition.new.ingredient "flour",
      NutritionProfileDefinition::Protein=>11.5, 
      NutritionProfileDefinition::Lipid=>1.45, 
      NutritionProfileDefinition::Sugars=>1.12, 
      NutritionProfileDefinition::Calcium=>20, 
      NutritionProfileDefinition::Sodium=>0
    assert actual.kind_of? NutritionProfile
    assert_equal "flour", actual.name
    assert_equal 11.5, actual.protein
    assert_equal 1.45, actual.lipid 
    assert_equal 1.12, actual.sugars
    assert_equal 20, actual.calcium
    assert_equal 0, actual.sodium
  end
  
end