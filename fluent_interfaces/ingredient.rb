class Ingredient
  attr_accessor :name, :quantity, :conversion_constant, :nutrition_profile

  def initialize(name="")
    @name = name
  end

  def weight
    @quantity * @conversion_constant
  end
  
end
