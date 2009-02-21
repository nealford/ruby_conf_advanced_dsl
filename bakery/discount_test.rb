require "test/unit"
require "discount"      
require "customer_profile"

class TestDiscount < Test::Unit::TestCase
  def test_synthesised_for_methods
    d = Discount.new
    d.for_membership(12)
    assert_equal 12, d.discount_for_membership
  end
  
  def test_discount_based_on_profile
    p = CustomerProfile.new
    p.member
    p.frequency(2)
    p.monthly_spending(20)
    
    d = Discount.new.based_on(p).for_membership(10.0).for_number_of_visits(10, 10.0).for_spending(100, 10.0);
   assert_equal 30.0, d.discount
  end

  def test_new_customer_profile_syntax
    c = CustomerProfile.has.
      member.
      frequency(2).
      monthly_spending(20)
    assert c.member_value
    assert_equal  2, c.frequency_value
    assert_equal  20, c.monthly_spending_value
  end

  def test_more_fluent_discount_syntax_using_is
    d = Discount.is.
      for_membership(12)
    assert_equal  12, d.discount_for_membership
  end
  
  
end
