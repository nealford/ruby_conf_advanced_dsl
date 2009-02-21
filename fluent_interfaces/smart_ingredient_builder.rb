module SmartIngredientBuilder
  @@INGREDIENTS = {
    "Flour" => "Flour", "Fluor" => "Flour", "Flower" => "Flour",
    "Flur" => "Flour", "Nutmeg" => "Nutmeg", "Knutmeg" => "Nutmeg"
  }
  def self.append_features(target)
    def target.const_missing(name)
      i = @@INGREDIENTS.keys.find do |val| 
        name.to_s ==  val
      end
      return Ingredient.new(@@INGREDIENTS[i]) unless i.nil? 
      raise "No such ingredient"
    end
    super
  end
end

