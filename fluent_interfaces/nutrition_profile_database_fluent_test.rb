require "test/unit"

require "nutrition_profile_database_fluent"

class TestNutritionProfileDatabaseFluent < Test::Unit::TestCase
  def test_get_profiles
    db = NutritionProfileDatabase.new
    assert db.profile.size > 0
    assert ! db.profile['flour'].nil?
    assert ! db.profile['nutmeg'].nil?
    assert ! db.profile['milk'].nil?        
    assert db.profile['foo'].nil?
  end
end