class Game

  attr_reader :player1, :player2, :which_turn, :turn_counter

  def initialize(player1, player2)
    @player1 = Player.new player1
    @player2 = Player.new player2
    @turn_counter = 0
  end

  def move
    bullet = Bullet.new
    if @turn_counter%2 == 0
      @player2.reduce_wall(bullet.total_points)
    else
      @player1.reduce_wall(bullet.total_points)
    end
  end
end