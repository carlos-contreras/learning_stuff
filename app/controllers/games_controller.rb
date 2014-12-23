class GamesController < ApplicationController
  before_action :set_game, only: [:edit, :update]

  # GET /games
  def index
    @ranking_table = Ranking.all.order(winner_reamaining_points: :desc)
  end

  # POST /create
  def create
    @game = Game.new(params[:player1], params[:player2])
    save_game_to_session
    redirect_to edit_game_path(1), notice: 'Game has started!'
  end

  # GET /games/new
  def new
  end

  # GET /games/:id/edit
  def edit
  end

  # PATCH /games/:id
  def update
    who_move = @game.who_move?
    move = @game.move
    if @game.winner?
      notice = "#{@game.winner.name} WON, #{@game.winner.wall_health} wall points reamaining."
      redirect_to games_path, notice: notice
    else
      save_game_to_session
      notice = "#{who_move}: has damage #{move} wall points to the opponent."
      redirect_to edit_game_path(1), notice: notice
    end
  end
  # - - - - - - -
  private
  def save_game_to_session
    session[:game] = @game.to_yaml
  end

  def set_game
    @game = YAML.load(session[:game])
  end
end
