class Game

  attr_reader :player1, :player2, :which_turn, :turn_counter, :winner

  def initialize(player1='Player1', player2='Player2')
    if player1 == ""
      @player1 = Player.new "Player1"
    else
      @player1 = Player.new player1
    end

    if player2 == ""
      @player2 = Player.new "Player2"
    else
      @player2 = Player.new player2
    end
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
    persist_on_ranking if winner?
    bullet
  end

  def winner?
    if self.winner
      true
    else
      false
    end
  end

  def who_move?
    if @turn_counter%2 == 0
      @player1.name
    else
      @player2.name
    end
  end

  def status
    "#{@player1.status}, #{@player2.status}"
  end

  private
  def persist_on_ranking
    Ranking.create(
      player1: @player1.name,
      player2: @player2.name,
      winner: @winner.name,
      winner_reamaining_points: @winner.wall_health
    )
  end

end