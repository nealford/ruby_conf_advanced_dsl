require File.dirname(__FILE__) + '/ingredient'

class Numeric
  def of ingredient
    if ingredient.kind_of? String
      ingredient = Ingredient.new(ingredient)
    end
    ingredient.quantity = self
    ingredient
  end
end

class Numeric
  def gram
    self
  end
  alias_method :grams, :gram

  def pound
    self * 453.59237
  end
  alias_method :pounds, :pound
  alias_method :lb, :pound
  alias_method :lbs, :pound
end
