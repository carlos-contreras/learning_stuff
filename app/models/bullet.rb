class Bullet

  attr_reader :points, :bonus

  def initialize
    @points = rand(1..5)
    @bonus = bonus_calc
  end

  def bonus_calc
    num = rand
    if num < 0.01
      20
    elsif num < 0.05
      10
    elsif num < 0.1
      5
    elsif num < 0.2
      2
    else
      0 
    end  
  end

  def total_value
    @points + @bonus
  end
end