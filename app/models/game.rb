class Game

  attr_reader :player1, :player2, :which_turn, :turn_counter, :winner

  def initialize(player1='Player1', player2='Player2')
    @player1 = Player.new player1
    @player2 = Player.new player2
    @turn_counter = 0
    @winner = nil
  end

  def move
    bullet = Bullet.generate_bullet
    if @turn_counter%2 == 0
      @player2.reduce_wall(bullet)
    else
      @player1.reduce_wall(bullet)
    end
    @turn_counter+=1
    if @player1.wall_health == 0
      @winner = @player2
    elsif @player2.wall_health == 0
      @winner = @player1
    end
  end

  def who_move?
    if @turn_counter%2 == 0
      @player1.name
    else
      @player2.name
    end
  end

  def to_s
    "#{@player1.name}: #{@player1.wall_health}, #{@player2.name}: #{@player2.wall_health}"
  end

end