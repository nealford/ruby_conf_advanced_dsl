require "test/unit"
require File.dirname(__FILE__) + '/../numeric_as_units'
require File.dirname(__FILE__) + '/../ingredient'

class TestIntegerAsUnits < Test::Unit::TestCase
  
  def test_ingredient_created_properly_using_string
    i = 2.grams.of "Flour"
    assert i.kind_of? Ingredient
    assert i.name == "Flour"
  end

  def test_gram
    1.upto(100) do |i|
      assert i == i.gram
      assert i == i.grams
    end
  end

  def test_pounds
    1.upto(100) do |i|
      expected = i * 453.59237
      assert expected == i.pound      
      assert expected == i.pounds
      assert expected == i.lb
      assert expected == i.lbs
    end      
  end

end