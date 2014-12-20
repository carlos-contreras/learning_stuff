class Bullet

  def self.generate_bullet
    rand(1..5) + self.bonus_calc
  end

  private

  def self.bonus_calc
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
end