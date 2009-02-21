require "test/unit"

require "rule_list_chained" 
require 'discount'
require 'customer_profile'

class TestRuleListChained < Test::Unit::TestCase
  def test_rule_list
    rules = RuleListChained.new
    comes_in_rarely = CustomerProfile.new.
        frequency(5).
        monthly_spending(20)
    everyday = CustomerProfile.new.
        member.
        frequency(25).
        monthly_spending(500)

    rules.add.
        based_on(comes_in_rarely).
        for_membership(5.0).
        for_spending(15, 5.0).
        for_number_of_visits(10, 5.0).
        save
        
    rules.add.
        based_on(everyday).
        for_membership(10.0).
        for_spending(100, 10.0).
        for_number_of_visits(20, 10.0)

    assert_equal 2, rules.count
    assert_equal 5.0, rules[0].discount
  end
end

