class CustomerProfile
  attr_reader :member_value, :frequency_value, :monthly_spending_value
   
  def initialize
    @member_value = false
  end

  def member
    @member_value = true
    self
  end

  def frequency(number_of_visits)
    @frequency_value = number_of_visits
    self
  end

  def monthly_spending(spending)
    @monthly_spending_value = spending
    self
  end

  def to_s
    str = ""
    str += "not a " if ! @member_value
    str += "member\tfrequency = #{@frequency_value}\t$$/month = #{@monthly_spending_value}"
  end
   
end