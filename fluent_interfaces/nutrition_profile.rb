class NutritionProfile
  attr_accessor :name, :protein, :lipid, :sugars, :calcium, :sodium

  def initialize(name, protein=0, lipid=0, sugars=0, calcium=0, sodium=0)
    @name = name
    @protein, @lipid, @sugars =  protein, lipid, sugars
    @calcium, @sodium = calcium, sodium
  end
  
  def self.create_from_hash(name, h)
    new(name, h['protein'], h['lipid'], h['sugars'], h['calcium'], h['sodium'])
  end                                                

  def to_s()
    "\tProtein: " +   @protein.to_s       +
    "\n\tLipid: " +   @lipid.to_s         +
    "\n\tSugars: " +  @sugars.to_s        +
    "\n\tCalcium: " + @calcium.to_s       +
    "\n\tSodium: " +  @sodium.to_s
  end

end   


