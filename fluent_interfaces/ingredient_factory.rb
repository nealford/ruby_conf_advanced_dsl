class Object
  def self.const_missing(sym)
    Ingredient.new(sym.to_s)
  end
end

