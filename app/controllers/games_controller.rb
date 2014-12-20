class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  def index
    @ranking_table = Ranking.all
  end

  def create
    @game = Game.new(params[:player1], params[:player2])
    session[:game] = @game.to_yaml
    redirect_to edit_game_path(1), notice: 'Game was successfully created.'
  end

  def new
  end

  def edit
  end

  def update
    @game.move
    if @game.winner
      Ranking.create do |record|
        record.player1 = @game.player1.name
        record.player2 = @game.player2.name
        record.winner = @game.winner.name
        record.winner_reamaining_points = @game.winner.wall_health
      end
      redirect_to games_path
    else
      session[:game] = @game.to_yaml
      redirect_to edit_game_path(1), notice: 'Move recorded'
    end
  end

   private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = YAML.load(session[:game])
    end
end
