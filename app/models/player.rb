class Player

  attr_reader :name, :wall_health

  def initialize(name='Player')
    @name = name
    @wall_health = 100
  end

  def reduce_wall(points)
    @wall_health-=points
    @wall_health = 0 unless @wall_health > 0
  end

  def status
    "#{self.name}: #{self.wall_health}"
  end
end