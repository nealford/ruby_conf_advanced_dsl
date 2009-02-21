require 'customer_profile'

class Discount
  attr_reader :discount_for_membership, :discount_for_number_of_visits, 
      :discount_for_spending, :visits, :spending

  def self.is
    Discount.new
  end
  
  def based_on(profile)
    @profile = profile
    self
  end

  def for_membership(discount)
    @discount_for_membership = discount
    self
  end
  
  def for_number_of_visits(visits, discount)
    @visits = visits
    @discount_for_number_of_visits = discount
    self
  end
  
  def for_spending(amount, discount)
    @spending = amount
    @discount_for_spending = discount
    self
  end
  
  def to_s
    "for profile #{@profile}, membership = #{@discount_for_membership}, visits = #{@discount_for_number_of_visits}, spending = #{@discount_for_spending}"
  end
   
  def discount
    calculated_discount = 0.0
    calculated_discount += @discount_for_membership if @profile.member_value
    calculated_discount += @discount_for_spending if @spending > @profile.monthly_spending_value
    calculated_discount += @discount_for_number_of_visits if @visits > @profile.frequency_value
    puts calculated_discount
    calculated_discount
  end
end
