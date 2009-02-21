class StickyRecipe
  attr_reader :ingredient

  def initialize
    @ingredient = []
  end
  
  def ingredients
    @ingredients = true
  end

  def self.consists_of &block
    block.yield
  end
  
end


class Ingredient
  attr_accessor :quantity, :unit, :name

  def initialize quantity=0, unit="", name=""
    @quantity, @unit, @name = quantity, unit, name
  end

  def self.process_line line
    class_eval("new(" + preprocess(line))
  end

  def self.preprocess line
    match = line.match /(\w+) (\w+) (.*)/
    parts = []
    parts <<  match[1].to_s + ' '
    parts << ', "' + match[2].to_s + '" '
    parts << ', "' +  match[3].to_s + '")'
    parts.join
  end

  def ==(other)
    unit == other.unit and quantity == other.quantity and name == other.name
  end
  
  
end
